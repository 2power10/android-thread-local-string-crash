#include <thread>
#include <string>

thread_local std::string s;

int main(int argc, char **argv) {
    std::thread t([](){
        s = "abc";
    });
    t.join();
    return 0;
}