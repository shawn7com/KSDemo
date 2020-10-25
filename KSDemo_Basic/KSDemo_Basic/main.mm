//
//  main.m
//  KSDemo_Basic
//
//  Created by Shawn on 2020/10/16.
//

#import <Foundation/Foundation.h>
#import <pthread.h>


class T {
    int a;
    
public:
    static T* shared() {
        static T *_instance = NULL;
        static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
        
        if (_instance == NULL) {
            pthread_mutex_lock(&mutex);
            if (_instance == NULL) {
                T *temp = new T;
                __compiler_barrier();
                os_compiler_barrier();
                _instance = temp;
            }
            pthread_mutex_unlock(&mutex);
        }
        return _instance;
    }
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        printf("shared T = %p\n", T::shared());
        
        dispatch_once_t token;
        dispatch_once(&token, ^{
            printf("once\n");
        });
    }
    return 0;
}

