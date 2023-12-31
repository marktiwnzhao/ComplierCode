package dragon;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;

public class DragonLexerRulesTest {
  InputStream is = System.in;

  @BeforeMethod
  public void setUp() throws IOException {
    is = new FileInputStream(Path.of("src/main/antlr/dragon/dragon0.txt").toFile());
  }

  @AfterMethod
  public void tearDown() {
  }

  @Test
  public void testGetAllTokens() throws IOException {
    CharStream input = CharStreams.fromStream(is);
    DragonLexerRules lexer = new DragonLexerRules(input);
    lexer.getAllTokens().forEach(System.out::println);
  }
}
