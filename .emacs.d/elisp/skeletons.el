
(define-skeleton block-skeleton-if-else
  "Insert an if/else"
  nil
  "if (" _ ") {" \n
  >  _ \n
  -4 "} else {" \n
  >  _ \n
  -4 "}"
  )

(define-skeleton block-skeleton-if
  "Insert an if"
  nil
  "if (" _ ") {" \n
  > _ \n
  -4 "}" \n
  )

(define-skeleton java-skeleton-main
  "Insert java main method"
  nil
  "public static void main(String[] args) {" \n
  > _ \n
  -4 "}"
  )

(define-skeleton python-skeleton-main
  "Insert python main method"
  nil
  "if __name__ == '__main__':" \n
  > _ \n
  )

(define-skeleton c-skeleton-main
  "Insert c/c++ main method"
  nil
  "int main(int argc, char *argv[]) {" \n
  > _ \n
  -4 "}" \n
  )

(define-skeleton c-skeleton-for-loop
  "Insert c-style for loop"
  nil
  "for (int i = 0; i < " _ "; ++i) {" \n
  > _ \n
  -4 "}" \n
  )

(define-skeleton java-skeleton-ctor
  "Insert java constructor"
  nil
  "public " _ "(" _ ") {" \n
  > _ \n
  -4 "}" \n
  )

(define-skeleton python-skeleton-ctor
  "Insert python constructor"
  nil
  "def __init__(self" _ "):" \n
  > _ \n
  )

(define-skeleton bash-skeleton-if-else
  "Insert bash if/else"
  nil
  "if [ " _ " ]" \n
   "then" \n
  > _ \n
  -4 "else" \n
  > _ \n
  -4 "fi" \n
  )

(define-skeleton bash-skeleton-if
  "Insert bash if"
  nil
  "if [ " _ " ]" \n
   "then" \n
  > _ \n
  -4 "fi" \n
  )

(define-skeleton tex-skeleton-enumerate
  "Insert latex begin/end enumerate"
  nil
  "\begin{enumerate}" \n
  > _
  "\end{enumerate}" \n
  )

(provide 'skeletons)
