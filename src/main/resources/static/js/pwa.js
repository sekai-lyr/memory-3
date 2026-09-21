(() => {
  const reducedMotionQuery = window.matchMedia("(prefers-reduced-motion: reduce)");
  const isReducedMotion = reducedMotionQuery.matches;

  // Native WAAPI keeps this Spring Boot/Thymeleaf app dependency-free while
  // following the same transform/opacity-first path as anime.js waapi.animate().
  const animateElement = (element, delay = 0, distance = 18) => {
    const clearMotionState = () => {
      element?.classList.remove("motion-pending");
      if (!element) return;
      element.style.opacity = "";
      element.style.transform = "";
      element.style.willChange = "auto";
    };

    if (!element || isReducedMotion || typeof element.animate !== "function") {
      clearMotionState();
      return;
    }

    try {
      element.style.willChange = "opacity, transform";
      const animation = element.animate(
        [
          { opacity: 0, transform: `translate3d(0, ${distance}px, 0)` },
          { opacity: 1, transform: "translate3d(0, 0, 0)" }
        ],
        {
          duration: 680,
          delay,
          easing: "cubic-bezier(0.22, 1, 0.36, 1)",
          fill: "both"
        }
      );

      animation.onfinish = () => {
        animation.cancel();
        clearMotionState();
      };
      animation.oncancel = clearMotionState;
    } catch (error) {
      clearMotionState();
    }
  };

  const setupMotion = () => {
    const root = document.documentElement;
    root.classList.add("motion-ready");

    if (isReducedMotion) {
      root.classList.add("reduced-motion");
      return;
    }

    const main = document.querySelector(".main-wrap");
    const firstContent = main?.firstElementChild;
    const entranceTargets = [
      document.querySelector(".topbar"),
      firstContent
    ].filter(Boolean);

    entranceTargets.forEach((element, index) => {
      element.classList.add("motion-pending");
      animateElement(element, index * 100, index === 0 ? 12 : 20);
    });

    const entranceChildSelectors = [
      ".quick-actions > *",
      ".dashboard-stats > *",
      ".report-metrics > *",
      ".graph-metrics > *",
      ".public-stats > *",
      ".batch-filter-grid > *",
      ".stats-grid > .stat-card"
    ];
    const entranceChildren = new Set();
    entranceChildSelectors.forEach((selector) => {
      firstContent?.querySelectorAll(selector).forEach((element) => entranceChildren.add(element));
    });
    [...entranceChildren].forEach((element, index) => {
      element.classList.add("motion-pending");
      animateElement(element, 180 + Math.min(index * 55, 330), 12);
    });

    const scrollSelectors = [
      ".main-wrap > :not(:first-child)",
      ".main-wrap > .content-grid > *",
      ".main-wrap > .list-panel > *",
      ".timeline-item",
      ".report-panel",
      ".module-card",
      ".stat-card",
      ".insight-card",
      ".mini-card",
      ".memory-card",
      ".search-result-card",
      ".recommendation-card",
      ".action-item",
      ".share-mini-card",
      ".feature-item",
      ".health-issue",
      ".duplicate-group",
      ".watch-plan-day"
    ];
    const scrollTargets = new Set();
    scrollSelectors.forEach((selector) => {
      document.querySelectorAll(selector).forEach((element) => {
        if (element !== firstContent && !firstContent?.contains(element)) {
          scrollTargets.add(element);
        }
      });
    });

    scrollTargets.forEach((element) => {
      element.classList.add("motion-card");
    });

    if ("IntersectionObserver" in window) {
      const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) return;

          const siblings = [...(entry.target.parentElement?.children || [])]
            .filter((sibling) => scrollTargets.has(sibling));
          const index = Math.max(0, siblings.indexOf(entry.target));
          entry.target.classList.add("motion-pending");
          animateElement(entry.target, Math.min(index * 55, 260));
          observer.unobserve(entry.target);
        });
      }, { threshold: 0.08, rootMargin: "0px 0px -8% 0px" });

      scrollTargets.forEach((element) => observer.observe(element));
    } else {
      scrollTargets.forEach((element) => animateElement(element));
    }
  };

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", setupMotion, { once: true });
  } else {
    setupMotion();
  }
})();

if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker.register("/sw.js").catch(() => {});
  });
}
