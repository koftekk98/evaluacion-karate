package features.marvel.heroes;

import com.intuit.karate.junit5.Karate;

class MarvelHeroesTest {
    static {
        System.setProperty("karate.ssl", "true");
    }

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testSmoke() {
        return Karate.run().relativeTo(getClass()).tags("@usersById");
    }

}
