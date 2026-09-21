package com.sekai.memory.book.control;

import com.sekai.memory.book.model.Anime;
import com.sekai.memory.book.model.CharacterFavorite;
import com.sekai.memory.book.model.Quote;
import com.sekai.memory.book.model.TimelineItem;
import com.sekai.memory.book.model.User;
import com.sekai.memory.book.service.AnimeService;
import com.sekai.memory.book.service.CharacterFavoriteService;
import com.sekai.memory.book.service.QuoteService;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class PageControlTimelineTest {

    @Mock
    private AnimeService animeService;

    @Mock
    private CharacterFavoriteService characterFavoriteService;

    @Mock
    private QuoteService quoteService;

    @Mock
    private HttpSession session;

    @InjectMocks
    private PageControl pageControl;

    @Test
    void timelineShouldContainOnlyAnimeItems() {
        User user = new User();
        user.setId(1L);
        user.setUserName("traveler");

        Anime anime = new Anime();
        anime.setId(1L);
        anime.setTitle("番剧");
        anime.setType("TV");
        anime.setReleaseDate(LocalDate.of(2024, 1, 1));

        CharacterFavorite character = new CharacterFavorite();
        character.setAnimeId(1L);
        character.setCharacterName("角色");
        character.setCreateTime(LocalDateTime.of(2025, 1, 1, 0, 0));

        Quote quote = new Quote();
        quote.setAnimeId(1L);
        quote.setCharacterName("角色");
        quote.setContent("台词");
        quote.setCreateTime(LocalDateTime.of(2026, 1, 1, 0, 0));

        when(session.getAttribute("loginUser")).thenReturn(user);
        when(animeService.listByUserId(1L)).thenReturn(List.of(anime));
        when(characterFavoriteService.listByUserId(1L)).thenReturn(List.of(character));
        when(quoteService.listByUserId(1L)).thenReturn(List.of(quote));

        ExtendedModelMap model = new ExtendedModelMap();
        assertEquals("timeline", pageControl.timeline(session, model));

        @SuppressWarnings("unchecked")
        List<TimelineItem> items = (List<TimelineItem>) model.getAttribute("timelineItems");
        // 时间线是"番剧时间线"，只展示番剧条目，不混入角色和台词
        assertEquals(1, items.size());
        assertEquals("anime", items.get(0).getType());
    }

    @Test
    void timelineShouldOrderAnimeByReleaseDate() {
        User user = new User();
        user.setId(1L);
        user.setUserName("traveler");

        Anime older = new Anime();
        older.setId(1L);
        older.setTitle("旧番");
        older.setReleaseDate(LocalDate.of(2020, 1, 1));
        older.setWatchDate(LocalDate.of(2025, 6, 1));

        Anime newer = new Anime();
        newer.setId(2L);
        newer.setTitle("新番");
        newer.setReleaseDate(LocalDate.of(2024, 1, 1));
        newer.setWatchDate(LocalDate.of(2024, 7, 1));

        when(session.getAttribute("loginUser")).thenReturn(user);
        when(animeService.listByUserId(1L)).thenReturn(List.of(older, newer));
        when(characterFavoriteService.listByUserId(1L)).thenReturn(List.of());
        when(quoteService.listByUserId(1L)).thenReturn(List.of());

        ExtendedModelMap model = new ExtendedModelMap();
        pageControl.timeline(session, model);

        @SuppressWarnings("unchecked")
        List<TimelineItem> items = (List<TimelineItem>) model.getAttribute("timelineItems");
        // 按番剧自身的上映/开播日期排序，而不是按观看/记录时间
        assertEquals(List.of("新番", "旧番"), items.stream()
                .map(TimelineItem::getTitle)
                .toList());
        assertEquals(LocalDateTime.of(2024, 1, 1, 0, 0), items.get(0).getOccurredAt());
    }
}
