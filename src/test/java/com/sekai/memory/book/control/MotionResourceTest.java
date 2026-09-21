package com.sekai.memory.book.control;

import org.junit.jupiter.api.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class MotionResourceTest {

    @Test
    void motionPendingStateMustKeepPageContentVisibleAsFallback() throws Exception {
        String css = Files.readString(Path.of("src/main/resources/static/css/app.css"), StandardCharsets.UTF_8);

        assertTrue(css.contains(".motion-pending {\n    opacity: 1;"));
    }

    @Test
    void timelineItemsMustNotBeHiddenBeforeIntersectionObserverRuns() throws Exception {
        String javascript = Files.readString(Path.of("src/main/resources/static/js/pwa.js"), StandardCharsets.UTF_8);

        assertFalse(javascript.contains("element.classList.add(\"motion-pending\", \"motion-card\");"));
        assertTrue(javascript.contains("element.classList.add(\"motion-card\");"));
    }
}
