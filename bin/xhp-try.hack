require_once(__DIR__."/../vendor/hh_autoload.php");

final class :a:post extends :x:element {
  attribute :a;

  use XHPHelpers;

  protected function render(): XHPRoot {
    $id = $this->getID();

    $anchor = <a>{$this->getChildren()}</a>;
    $form = (
      <form
        id={$id}
        method="post"
        action={$this->:href}
        target={$this->:target}
        class="postLink">
        {$anchor}
      </form>
    );

    $this->transferAllAttributes($anchor);
    $anchor->setAttribute(
      'onclick',
      'document.getElementById("'.$id.'").submit(); return false;',
    );
    $anchor->setAttribute('href', '#');

    return $form;
  }
}
function intro_examples_tag_matching_validation_using_string(): void {
  echo '<div class="section-header">';
  echo '<a href="#use">You should have used <span class="xhp">XHP</span></a>';
  echo '</div>';
}

function intro_examples_tag_matching_validation_using_xhp(): void {
  // Typechecker error
  // Fatal syntax error at runtime
  echo
    <div class="section-header">
      <a href="#use">You should have used <span class="xhp">XHP</span></a>
    </div>;
}
function intro_examples_tag_matching_validation_run(): void {
  intro_examples_tag_matching_validation_using_string();
  intro_examples_tag_matching_validation_using_xhp();
}
function intro_examples_avoid_xss_using_string(string $could_be_bad): void {
  // Could call htmlspecialchars() here
  echo '<html><head/><body> '.$could_be_bad.'</body></html>';
}

function intro_examples_avoid_xss_using_xhp(string $could_be_bad): void {
  // The string $could_be_bad will be escaped to HTML entities like:
  // <html><head></head><body>&lt;blink&gt;Ugh&lt;/blink&gt;</body></html>
  echo
    <html>
      <head />
      <body>{$could_be_bad}</body>
    </html>;
}

function intro_examples_avoid_xss_run(string $could_be_bad): void {
  intro_examples_avoid_xss_using_string($could_be_bad);
  echo PHP_EOL.PHP_EOL;
  intro_examples_avoid_xss_using_xhp($could_be_bad);
}
function basic_usage_examples_basic_xhp(): void {
  var_dump(
    <div>
      My Text
      <strong>My Bold Text</strong>
      <i>My Italic Text</i>
    </div>,
  );
}
<<__EntryPoint>>
function intro_examples_a_a_post(): void {
  $get_link = <a href="http://www.example.com">I'm a normal link</a>;
  $post_link =
    <a:post href="http://www.example.com">I make a POST REQUEST</a:post>;

  echo $get_link;
  echo "\n";
  echo $post_link;
  intro_examples_tag_matching_validation_run();
  intro_examples_avoid_xss_run('<blink>Ugh</blink>');
  basic_usage_examples_basic_xhp();
  exit(0);
}
