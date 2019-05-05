#include <string>
using namespace std;

class Session{
public:
   int id_expert;
   int id_form;
   int id_question;
   int id_answer;
   int startDateTime;
   int endDateTime;
};

class Expert{
public:
   int id_expert;
   void setlogin(string log){
   	login = log;
   };
   string getlogin(){
   	return login;
   };
   void setpassword(string log){
   	password = log;
   };
   string getpassword(){
   	return password;
   };
   void setemail(string log){
   	email = log;
   };
   string getemail(){
   	return email;
   };
private:
   string login;
   string password;
   string email;
};

class Form{
public:
	int id_form;
private:
	string name;
	string type;
};

class Question{
public:
    int id_question;
    int id_form;
    int number;
    void settype(string log){
   	type = log;
   };
   string gettype(){
   	return type;
   };
   void setquestion(string log){
   	question = log;
   };
   string getquestion(){
   	return question;
   };
private:
    string type;
    string question;
};


class Answer{
public:
   int id_answer;
   int id_question;
   void setanswer(string log){
   	answer = log;
   };
   string getanswer(){
   	return answer;
   };
 private:
   string answer;
};