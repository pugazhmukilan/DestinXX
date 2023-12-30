
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
              "question": "What is the purpose of the 'zip()' function in Python?",
              "options": [
                "It is used to compress files and folders.",
                "It is used to merge two dictionaries.",
                "It is used to combine elements from multiple iterables into tuples.",
                "It is used to calculate the length of a list."
              ],
              "correctIndex": 2
            },

            {
              "question": "Explain the concept of a generator in Python.",
              "options": [
                "Generators are functions that create instances of classes.",
                "Generators are used to generate random numbers in Python.",
                "Generators are a type of iterable, allowing the iteration over a potentially large set of data.",
                "Generators are used for defining private variables in a class."
              ],
              "correctIndex": 2
            },

            {
              "question": "How does the 'isinstance()' function work in Python?",
              "options": [
                "It checks if an object is an instance of a specific class or type.",
                "It compares two objects for identity.",
                "It checks if an object is equal to another object.",
                "It verifies if an object is mutable or immutable."
              ],
              "correctIndex": 0
            },

            {
              "question": "What is the purpose of the 'format()' method in Python strings?",
              "options": [
                "It is used to format the font style of a string.",
                "It is used for numerical formatting, such as setting precision or padding.",
                "It is used to convert a string to uppercase or lowercase.",
                "It is used to remove whitespace from both ends of a string."
              ],
              "correctIndex": 1
            },

            {
              "question": "Explain the concept of a 'closure' in Python.",
              "options": [
                "A closure is a way to close a Python script.",
                "A closure is a function object that has access to variables in its lexical scope, even when the function is called outside that scope.",
                "A closure is a built-in module for handling file closures.",
                "A closure is a method for closing Python classes."
              ],
              "correctIndex": 1
            },

            {
              "question": "What is the purpose of the 'json' module in Python?",
              "options": [
                "It is used for handling exceptions in Python.",
                "It is used for compressing and decompressing files.",
                "It is used for working with JSON data, encoding and decoding.",
                "It is used for sorting elements in a list."
              ],
              "correctIndex": 2
            },

            {
              "question": "How does the 'pop()' method work in Python dictionaries?",
              "options": [
                "It removes the last element from a list.",
                "It retrieves the value associated with a specified key and removes the key-value pair from the dictionary.",
                "It appends an element to the end of a list.",
                "It reverses the order of elements in a list."
              ],
              "correctIndex": 1
            },

            {
              "question": "What is the purpose of the '__init__()' method in Python classes?",
              "options": [
                "It is used to initialize a new object of a class.",
                "It is used for defining a static method in a class.",
                "It is used to create a shallow copy of an object.",
                "It is used to access the superclass of a class."
              ],
              "correctIndex": 0
            },

            {
              "question": "Explain the concept of 'list slicing' in Python.",
              "options": [
                "List slicing is a way to remove elements from a list based on a given condition.",
                "List slicing is a method for converting a list into a tuple.",
                "List slicing is a technique for accessing a subset of elements from a list using a specified range.",
                "List slicing is a method for adding elements to the beginning of a list."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the 'sorted()' function in Python?",
              "options": [
                "It is used to reverse the order of elements in a list.",
                "It is used to sort elements in a list in ascending order.",
                "It is used to shuffle the elements of a list randomly.",
                "It is used to filter elements from a list based on a given condition."
              ],
              "correctIndex": 1
            },
            {
              "question": "Explain the concept of metaclasses in Python.",
              "options": [
                "Metaclasses are used to create instances of classes.",
                "Metaclasses are a way to define abstract classes in Python.",
                "Metaclasses are classes for classes, allowing you to customize the creation of classes.",
                "Metaclasses are used for implementing multiple inheritance in Python."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the Global Interpreter Lock (GIL) in Python, and how does it impact multi-threading?",
              "options": [
                "GIL is a mechanism to prevent race conditions in Python programs.",
                "GIL is responsible for garbage collection in Python.",
                "GIL is a lock that allows only one thread to execute Python bytecode at a time, impacting the performance of multi-threading.",
                "GIL is a feature that enables parallel processing in Python."
              ],
              "correctIndex": 2
            },

            {
              "question": "Explain the use of the 'asyncio' module in Python and its role in asynchronous programming.",
              "options": [
                "'asyncio' is used for handling file input/output operations asynchronously.",
                "'asyncio' is a module for defining asynchronous functions in Python.",
                "'asyncio' is a framework for writing single-threaded concurrent code using coroutines, multiplexing I/O access over sockets and other resources.",
                "'asyncio' is used for creating parallel threads in Python."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the '__slots__' attribute in Python classes?",
              "options": [
                "It is used to define private variables in a class.",
                "It is used to specify the base classes of a class.",
                "It is used to limit the attributes that can be assigned to instances of a class, optimizing memory usage.",
                "It is used to create read-only attributes in a class."
              ],
              "correctIndex": 2
            },

            {
              "question": "Explain the differences between 'deep copy' and 'shallow copy' in Python.",
              "options": [
                "'Deep copy' creates a new object with a new memory address, while 'shallow copy' creates a new object but shares the memory address of the original object.",
                "'Deep copy' and 'shallow copy' are two terms for the same operation in Python.",
                "'Deep copy' is used for copying elements from one list to another, while 'shallow copy' is used for copying dictionaries.",
                "'Deep copy' is used for copying nested lists, while 'shallow copy' is used for copying flat lists."
              ],
              "correctIndex": 0
            },

            {
              "question": "How does the 'async with' statement work in Python's asynchronous programming?",
              "options": [
                "It is used for conditional execution of code blocks in asynchronous functions.",
                "It is used to create a context manager in asynchronous code, similar to 'with' in synchronous code.",
                "It is used for raising and handling exceptions in asynchronous functions.",
                "It is used to define a coroutine in Python."
              ],
              "correctIndex": 1
            },

            {
              "question": "Explain the use of decorators with arguments in Python and provide an example.",
              "options": [
                "Decorators with arguments are used for defining class attributes.",
                "Decorators with arguments are not supported in Python.",
                "Decorators with arguments allow customization of the behavior of a decorated function.",
                "Decorators with arguments are used for defining custom exceptions."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the 'async for' statement in Python's asynchronous programming?",
              "options": [
                "It is used for iterating over synchronous sequences in asynchronous functions.",
                "It is used to create a generator in asynchronous code.",
                "It is used for conditional execution of code blocks in asynchronous functions.",
                "It is used for asynchronous iteration over asynchronous sequences, such as streams or databases."
              ],
              "correctIndex": 3
            },

            {
              "question": "Explain the concept of memoization in Python and how it can improve the performance of recursive functions.",
              "options": [
                "Memoization is a technique for caching the results of expensive function calls and returning the cached result when the same inputs occur again.",
                "Memoization is a method for encrypting and decrypting data in Python.",
                "Memoization is a way to define private methods in a class.",
                "Memoization is a feature for optimizing memory usage in Python programs."
              ],
              "correctIndex": 0
            },

            {
              "question": "What is the purpose of the 'concurrent.futures' module in Python?",
              "options": [
                "It is used for handling file input/output operations asynchronously.",
                "It is used for defining abstract classes in Python.",
                "It is used for creating and managing threads and processes for concurrent execution of tasks.",
                "It is used for working with JSON data, encoding and decoding."
              ],
              "correctIndex": 2
            },
            {
              "question": "Explain the concept of a context manager in Python and provide an example.",
              "options": [
                "Context managers are used for handling exceptions in Python.",
                "Context managers are a way to manage resources, such as files or network connections, by acquiring and releasing them automatically.",
                "Context managers are used for defining decorators in Python.",
                "Context managers are classes for handling asynchronous programming."
              ],
              "correctIndex": 1
            },

            {
              "question": "What is the purpose of the 'collections' module in Python?",
              "options": [
                "It is used for creating and manipulating collections, such as lists and dictionaries.",
                "It is used for sorting elements in a list.",
                "It is used for defining custom exceptions in Python.",
                "It is used for handling file input/output operations."
              ],
              "correctIndex": 0
            },

            {
              "question": "Explain the differences between a shallow copy and a deep copy in Python dictionaries.",
              "options": [
                "A shallow copy creates a new dictionary with a new memory address, while a deep copy creates a new dictionary but shares the memory address of the original dictionary.",
                "Shallow copy and deep copy are two terms for the same operation in Python dictionaries.",
                "A shallow copy creates a new dictionary that shares the memory address of the original dictionary, while a deep copy creates a new dictionary with a new memory address.",
                "Both shallow copy and deep copy create new dictionaries with new memory addresses."
              ],
              "correctIndex": 2
            },

            {
              "question": "How does the 'collections.Counter' class work in Python and what is its primary use?",
              "options": [
                "It is used for counting the number of elements in a list.",
                "It is used for creating instances of classes.",
                "It is used for creating and updating a counter dictionary, counting the occurrences of elements in an iterable.",
                "It is used for handling exceptions in Python."
              ],
              "correctIndex": 2
            },

            {
              "question": "Explain the purpose of the 'staticmethod' decorator in Python and provide an example.",
              "options": [
                "It is used for defining a method that can access and modify class attributes.",
                "It is used for declaring a method that can only be called on an instance of a class.",
                "It is used for creating a static method in a class, which does not require access to the instance or class itself.",
                "It is used for defining abstract classes in Python."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the 'repr()' function in Python?",
              "options": [
                "It is used for sorting elements in a list.",
                "It is used for creating a string representation of an object, which, if passed to 'eval()', would create an equivalent object.",
                "It is used for removing elements from a list based on a given condition.",
                "It is used for compressing and decompressing files."
              ],
              "correctIndex": 1
            },

            {
              "question": "Explain the concept of method chaining in Python and provide an example.",
              "options": [
                "Method chaining is a way to call multiple methods on an object in a single line, where each method returns the modified object.",
                "Method chaining is a method for handling file input/output operations asynchronously.",
                "Method chaining is used for defining private variables in a class.",
                "Method chaining is a way to create instances of classes."
              ],
              "correctIndex": 0
            },

            {
              "question": "What is the purpose of the 'functools' module in Python?",
              "options": [
                "It is used for creating and manipulating collections, such as lists and dictionaries.",
                "It is used for defining custom exceptions in Python.",
                "It is used for working with JSON data, encoding and decoding.",
                "It is used for higher-order functions and operations on callable objects."
              ],
              "correctIndex": 3
            },

            {
              "question": "Explain the use of the 'hash()' function in Python and its limitations.",
              "options": [
                "The 'hash()' function is used for sorting elements in a list.",
                "The 'hash()' function is used for creating a hash table in Python.",
                "The 'hash()' function is used for generating hash values for objects, but it has limitations, such as not supporting mutable objects.",
                "The 'hash()' function is used for creating a deep copy of an object."
              ],
              "correctIndex": 2
            },

            {
              "question": "How does the 'os.path.join()' function work in Python and what is its primary use?",
              "options": [
                "'os.path.join()' is used for joining two strings in Python.",
                "'os.path.join()' is used for creating directories in Python.",
                "'os.path.join()' is used for normalizing paths by joining path components intelligently.",
                "'os.path.join()' is used for filtering elements from a list based on a given condition."
              ],
              "correctIndex": 2
            },

            {
              "question": "Explain the purpose of the 'threading' module in Python and its role in concurrent programming.",
              "options": [
                "'threading' is used for sorting elements in a list.",
                "'threading' is used for handling file input/output operations asynchronously.",
                "'threading' is used for creating and managing threads for concurrent execution of tasks.",
                "'threading' is used for defining decorators in Python."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the 'itertools' module in Python?",
              "options": [
                "'itertools' is used for creating and manipulating collections, such as lists and dictionaries.",
                "'itertools' is used for sorting elements in a list.",
                "'itertools' is used for defining custom exceptions in Python.",
                "'itertools' is used for working with iterators and generators, providing a set of fast, memory-efficient tools."
              ],
              "correctIndex": 3
            },

            {
              "question": "Explain the differences between 'instance variables' and 'class variables' in Python classes.",
              "options": [
                "'Instance variables' are shared among all instances of a class, while 'class variables' are specific to each instance of a class.",
                "'Instance variables' are defined outside the class, while 'class variables' are defined inside the class.",
                "'Instance variables' are specific to each instance of a class, while 'class variables' are shared among all instances of a class.",
                "'Instance variables' and 'class variables' are interchangeable terms in Python classes."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the 'pickle' module in Python?",
              "options": [
                "It is used for creating and manipulating collections, such as lists and dictionaries.",
                "It is used for sorting elements in a list.",
                "It is used for defining custom exceptions in Python.",
                "It is used for serializing and deserializing objects, allowing them to be saved to or loaded from a file."
              ],
              "correctIndex": 3
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
              "question": "Explain the difference between 'stack' and 'heap' memory in C++.",
              "options": [
                "'Stack' is used for dynamic memory allocation, while 'heap' is used for storing local variables.",
                "'Stack' is used for storing local variables, while 'heap' is used for dynamic memory allocation.",
                "Both 'stack' and 'heap' are used for dynamic memory allocation.",
                "'Stack' is used for global variables, while 'heap' is used for storing local variables."
              ],
              "correctIndex": 1
            },

            {
              "question": "What is the purpose of the 'new' and 'delete' operators in C++?",
              "options": [
                "'new' is used for creating a new instance of a class, and 'delete' is used for deleting an object.",
                "'new' is used for dynamic memory allocation, and 'delete' is used for freeing allocated memory.",
                "'new' is used for initializing variables, and 'delete' is used for deleting variables.",
                "'new' and 'delete' are used for file input/output operations in C++."
              ],
              "correctIndex": 1
            },

            {
              "question": "Explain the concept of function overloading in C++.",
              "options": [
                "Function overloading is a way to define multiple functions with the same name but different return types.",
                "Function overloading is a feature that allows a function to accept different types of parameters.",
                "Function overloading is a technique for creating new functions by inheriting from existing functions.",
                "Function overloading is a way to define multiple functions with the same name but different parameters or parameter types."
              ],
              "correctIndex": 3
            },

            {
              "question": "What is the role of the 'const' keyword in C++?",
              "options": [
                "'const' is used to declare constant variables that cannot be modified after initialization.",
                "'const' is used for defining constant functions that cannot modify the object's state.",
                "'const' is used for creating constant pointers that cannot point to a different memory location.",
                "'const' is a keyword reserved for future use and has no current functionality in C++."
              ],
              "correctIndex": 0
            },

            {
              "question": "Explain the purpose of the 'friend' keyword in C++.",
              "options": [
                "'friend' is used for creating friend classes that can access private and protected members of another class.",
                "'friend' is a keyword used for specifying friend functions that are not bound by access restrictions.",
                "'friend' is used for defining classes with friendship levels, allowing controlled access to members.",
                "'friend' is a reserved keyword with no functionality in C++."
              ],
              "correctIndex": 1
            },

            {
              "question": "How does the 'namespace' feature work in C++?",
              "options": [
                "A 'namespace' is a way to define classes in a C++ program.",
                "A 'namespace' is a feature for creating global variables in C++.",
                "A 'namespace' is used for preventing naming conflicts by encapsulating code in a separate scope.",
                "A 'namespace' is a reserved keyword with no functionality in C++."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the 'virtual' keyword in C++?",
              "options": [
                "'virtual' is used for creating virtual functions that can be overridden by derived classes.",
                "'virtual' is used for defining virtual variables in C++.",
                "'virtual' is a keyword reserved for future use and has no current functionality in C++.",
                "'virtual' is used for declaring pure virtual functions that must be implemented by derived classes."
              ],
              "correctIndex": 0
            },

            {
              "question": "Explain the concept of operator overloading in C++.",
              "options": [
                "Operator overloading is a way to define multiple operators with the same functionality in C++.",
                "Operator overloading is a feature for creating custom operators in C++.",
                "Operator overloading is a technique for overloading built-in operators to work with user-defined types.",
                "Operator overloading is a reserved keyword with no functionality in C++."
              ],
              "correctIndex": 2
            },

            {
              "question": "What is the purpose of the 'inline' keyword in C++?",
              "options": [
                "'inline' is used for inlining functions, providing a performance boost by inserting the function code directly at the call site.",
                "'inline' is a keyword reserved for future use and has no current functionality in C++.",
                "'inline' is used for defining classes with inline functions that cannot be called externally.",
                "'inline' is used for creating inline variables in C++."
              ],
              "correctIndex": 0
            },

            {
              "question": "How does the 'const_cast' operator work in C++?",
              "options": [
                "'const_cast' is used for casting pointers to constant objects to non-constant pointers.",
                "'const_cast' is used for converting integer types to floating-point types.",
                "'const_cast' is a reserved keyword with no functionality in C++.",
                "'const_cast' is used for casting pointers to non-constant objects to constant pointers."
              ],
              "correctIndex": 0
            },

            {
              "question": "Explain the concept of multiple inheritance in C++.",
              "options": [
                "Multiple inheritance is a feature for inheriting from multiple classes simultaneously in C++.",
                "Multiple inheritance is a way to define multiple constructors for a single class.",
                "Multiple inheritance is a technique for creating classes with multiple instances of the same base class.",
                "Multiple inheritance is a reserved keyword with no functionality in C++."
              ],
              "correctIndex": 0
            },

            {
              "question": "What is the purpose of the 'typeid' operator in C++?",
              "options": [
                "'typeid' is used for calculating the type size of objects in C++.",
                "'typeid' is used for obtaining information about the type of an expression or object.",
                "'typeid' is a reserved keyword with no functionality in C++.",
                "'typeid' is used for defining custom types in C++."
              ],
              "correctIndex": 1
            },

            {
              "question": "Explain the concept of smart pointers in C++.",
              "options": [
                "Smart pointers are a way to create pointers with a fixed memory size in C++.",
                "Smart pointers are a feature for automatically managing memory in C++, preventing memory leaks.",
                "Smart pointers are a reserved keyword with no functionality in C++.",
                "Smart pointers are used for creating pointers to constant objects."
              ],
              "correctIndex": 1
            },
            {
            "question": "What is the purpose of the 'volatile' keyword in C++?",
            "options": [
              "'volatile' is used for defining volatile variables that cannot be modified after initialization.",
              "'volatile' is used for creating volatile functions in C++.",
              "'volatile' is a keyword reserved for future use and has no current functionality in C++.",
              "'volatile' is used for specifying that a variable may be changed by multiple threads or external sources, preventing compiler optimizations."
            ],
            "correctIndex": 3
          },

          {
            "question": "Explain the concept of function templates in C++.",
            "options": [
              "Function templates are a feature for creating templated functions in C++, allowing the use of generic types.",
              "Function templates are used for creating functions that accept variable numbers of arguments.",
              "Function templates are a reserved keyword with no functionality in C++.",
              "Function templates are a way to define multiple functions with the same name but different return types."
            ],
            "correctIndex": 0
          },

          {
            "question": "What is the purpose of the 'override' keyword in C++?",
            "options": [
              "'override' is used for overriding virtual functions in derived classes, providing compile-time safety.",
              "'override' is used for defining overloads of non-virtual functions in C++.",
              "'override' is a keyword reserved for future use and has no current functionality in C++.",
              "'override' is used for explicitly declaring friend functions in C++."
            ],
            "correctIndex": 0
          },

          {
            "question": "Explain the concept of RAII (Resource Acquisition Is Initialization) in C++.",
            "options": [
              "RAII is a technique for creating resource leaks in C++ programs.",
              "RAII is a feature for managing resources, where resource acquisition is tied to object initialization and resource release to object destruction.",
              "RAII is a reserved keyword with no functionality in C++.",
              "RAII is used for defining recursive functions in C++."
            ],
            "correctIndex": 1
          },

          {
            "question": "How does the 'decltype' keyword work in C++?",
            "options": [
              "'decltype' is used for defining template classes in C++.",
              "'decltype' is a keyword reserved for future use and has no current functionality in C++.",
              "'decltype' is used for declaring derived classes.",
              "'decltype' is used for obtaining the type of an expression or variable at compile-time."
            ],
            "correctIndex": 3
          },

          {
            "question": "What is the purpose of the 'std::move' function in C++?",
            "options": [
              "'std::move' is used for moving an object from one memory location to another in C++.",
              "'std::move' is a reserved keyword with no functionality in C++.",
              "'std::move' is used for defining move constructors in C++.",
              "'std::move' is used for converting an object to a constant in C++."
            ],
            "correctIndex": 0
          },

          {
            "question": "Explain the concept of lambda expressions in C++.",
            "options": [
              "Lambda expressions are a feature for defining anonymous classes in C++.",
              "Lambda expressions are a reserved keyword with no functionality in C++.",
              "Lambda expressions are used for creating inline functions without the need for a separate function declaration.",
              "Lambda expressions are a way to define template functions in C++."
            ],
            "correctIndex": 2
          },

          {
            "question": "What is the purpose of the 'constexpr' keyword in C++?",
            "options": [
              "'constexpr' is used for defining constant variables in C++.",
              "'constexpr' is used for declaring constant functions that can be evaluated at compile-time.",
              "'constexpr' is a reserved keyword with no functionality in C++.",
              "'constexpr' is used for creating constant pointers in C++."
            ],
            "correctIndex": 1
          },

          {
            "question": "Explain the concept of the 'std::unique_ptr' in C++ and its advantages.",
            "options": [
              "'std::unique_ptr' is a way to create unique pointers in C++, ensuring exclusive ownership of the allocated memory.",
              "'std::unique_ptr' is a reserved keyword with no functionality in C++.",
              "'std::unique_ptr' is used for defining unique classes in C++.",
              "'std::unique_ptr' is a feature for creating pointers with shared ownership in C++."
            ],
            "correctIndex": 0
          },

          {
            "question": "What is the purpose of the 'final' keyword in C++?",
            "options": [
              "'final' is used for declaring a class that cannot be inherited in C++.",
              "'final' is a reserved keyword with no functionality in C++.",
              "'final' is used for defining final variables in C++.",
              "'final' is used for declaring a function that cannot be overridden in derived classes."
            ],
            "correctIndex": 0
          },

          {
            "question": "Explain the use of the 'std::thread' class in C++ for multithreading.",
            "options": [
              "'std::thread' is a reserved keyword with no functionality in C++.",
              "'std::thread' is used for creating thread-safe classes in C++.",
              "'std::thread' is used for defining thread functions in C++.",
              "'std::thread' is used for creating and managing threads for concurrent execution of tasks in C++."
            ],
            "correctIndex": 3
          },

          {
            "question": "What is the purpose of the 'decltype(auto)' specifier in C++?",
            "options": [
              "'decltype(auto)' is a reserved keyword with no functionality in C++.",
              "'decltype(auto)' is used for creating auto-inferred variables in C++.",
              "'decltype(auto)' is used for explicitly specifying the return type of a function in C++.",
              "'decltype(auto)' is used for creating auto-inferred reference variables in C++."
            ],
            "correctIndex": 2
          },

          {
            "question": "Explain the concept of the 'std::initializer_list' in C++.",
            "options": [
              "'std::initializer_list' is a reserved keyword with no functionality in C++.",
              "'std::initializer_list' is used for defining initial values for arrays in C++.",
              "'std::initializer_list' is used for creating lists of elements in C++.",
              "'std::initializer_list' is used for passing a variable number of arguments to a function in C++."
            ],
            "correctIndex": 3
          },

          {
            "question": "What is the purpose of the 'std::mutex' class in C++ for synchronization?",
            "options": [
              "'std::mutex' is used for creating mutex variables in C++.",
              "'std::mutex' is a reserved keyword with no functionality in C++.",
              "'std::mutex' is used for defining mutex functions in C++.",
              "'std::mutex' is used for creating and managing locks to synchronize access to shared resources in multithreaded programs in C++."
            ],
            "correctIndex": 3
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