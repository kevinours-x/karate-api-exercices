import com.intuit.karate.junit5.Karate;

public class Runner_Jour01_GetUser {

   @Karate.Test
          // ===== 🟢 JOUR 1 - GetUser01 =====

    Karate Jour1_GetUser01() {
        // - Découvrir Karate
        return Karate.run("classpath:features/formation/jour1/Jour01_GetUser.feature");
}

}