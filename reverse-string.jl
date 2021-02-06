using Unicode

myreverse(s) = join(reverse(collect(graphemes(s))))

const TEST_GRAPHEMES = true

