
const String quizData = '''
  {
    "categories": [
      {
        "name": "Technical",
        "subcategories": [
          {
            "name": "Python",
            "questions": [
              {
                "question": "What is the main use of Python?",
                "options": ["Web development", "Machine learning", "Data analysis", "All of the above"],
                "correctIndex": 3
              },
              {
                "question": "Another Python question...",
                "options": ["Option A", "Option B", "Option C", "Option D"],
                "correctIndex": 1
              }
            ]
          },
          {
            "name": "C++",
            "questions": [
              {
                "question": "Which keyword is used to define a class in C++?",
                "options": ["class", "struct", "type", "define"],
                "correctIndex": 0
              },
              {
                "question": "Another C++ question...",
                "options": ["Option A", "Option B", "Option C", "Option D"],
                "correctIndex": 2
              }
            ]
          },
          {
            "name": "Java",
            "questions": [
              {
                "question": "What is the primary purpose of the 'static' keyword in Java?",
                "options": ["To create constant variables", "To define a static method", "To allocate memory", "To create a singleton class"],
                "correctIndex": 1
              },
              {
                "question": "Another Java question...",
                "options": ["Option A", "Option B", "Option C", "Option D"],
                "correctIndex": 3
              },
              {
    "question": "Explain the concept of 'dependency injection' in software development.",
    "options": [
      "It is a design pattern to improve the performance of an application.",
      "It is a technique to inject dependencies into a class during runtime.",
      "It is used to create circular dependencies in a program.",
      "It is a type of exception in Java."
    ],
    "correctIndex": 1
  },
  {
    "question": "What is the purpose of the 'StringBuilder' class in Java?",
    "options": [
      "It is used for creating mutable sequences of characters.",
      "It is a class to perform string concatenation.",
      "It is used for parsing JSON data.",
      "It is a class for creating immutable strings."
    ],
    "correctIndex": 0
  },
  {
    "question": "Explain the difference between 'Stack' and 'Queue' data structures.",
    "options": [
      "Stack follows the First-In-First-Out (FIFO) principle, while Queue follows the Last-In-First-Out (LIFO) principle.",
      "Stack follows the Last-In-First-Out (LIFO) principle, while Queue follows the First-In-First-Out (FIFO) principle.",
      "Stack and Queue both follow the First-In-First-Out (FIFO) principle.",
      "Stack and Queue both follow the Last-In-First-Out (LIFO) principle."
    ],
    "correctIndex": 1
  },
  {
    "question": "What is the purpose of the 'Observer' design pattern?",
    "options": [
      "It is used to encapsulate an algorithm.",
      "It is a behavioral design pattern to define a one-to-many dependency between objects.",
      "It is used to create instances of classes.",
      "It is a design pattern to manage database connections."
    ],
    "correctIndex": 1
  },
  {
    "question": "Explain the concept of 'Big O notation' in algorithm analysis.",
    "options": [
      "It is used to represent constant time complexity.",
      "It is a notation to describe the worst-case time complexity of an algorithm.",
      "It is a notation to describe the best-case time complexity of an algorithm.",
      "It is used to denote the size of an array."
    ],
    "correctIndex": 1
  },
  {
    "question": "What is the purpose of the 'Decorator' design pattern?",
    "options": [
      "It is used to create an object from an interface.",
      "It is a structural design pattern to attach additional responsibilities to an object.",
      "It is a pattern to define an interface for creating an object.",
      "It is used to encapsulate an algorithm."
    ],
    "correctIndex": 1
  },
  {
    "question": "Explain the concept of 'Recursion' in programming.",
    "options": [
      "It is a way to create objects in object-oriented programming.",
      "It is a programming technique where a function calls itself.",
      "It is a mechanism to handle exceptions in Java.",
      "It is a method to declare constant variables."
    ],
    "correctIndex": 1
  },
  {
    "question": "What is the purpose of the 'MVC' architecture in software development?",
    "options": [
      "It is a programming paradigm to define the structure of a program.",
      "It is a design pattern to create instances of classes.",
      "It is an architectural pattern to separate an application into three interconnected components: Model, View, and Controller.",
      "It is used to represent constant time complexity."
    ],
    "correctIndex": 2
  },
  {
    "question": "Explain the concept of 'Bitwise Operators' in programming.",
    "options": [
      "They are used to perform operations on individual bits of a binary number.",
      "They represent a sequence of characters.",
      "They are used for exception handling.",
      "They are used to create constants."
    ],
    "correctIndex": 0
  },
  {
    "question": "What is the purpose of the 'Singleton' design pattern?",
    "options": [
      "It is a pattern to define an interface for creating an object.",
      "It is used to create instances of classes.",
      "It is a creational design pattern to ensure a class has only one instance and provides a global point of access to it.",
      "It is a mechanism to prevent method calls."
    ],
    "correctIndex": 2
  },
  {
    "question": "Explain the concept of 'Heap' and 'Stack' memory in Java.",
    "options": [
      "Heap memory is used for storing local variables, while Stack memory is used for dynamic memory allocation.",
      "Heap memory is used for dynamic memory allocation, while Stack memory is used for storing local variables.",
      "Both Heap and Stack memory are used for dynamic memory allocation.",
      "Heap memory is used for global variables, while Stack memory is used for storing local variables."
    ],
    "correctIndex": 1
  }

            ]
          }
        ]
      },
      {
        "name": "Design",
        "subcategories": [
         
        ]
      },
      {
        "name": "Management",
        "subcategories": [
          
        ]
      }
    ]
  }
''';