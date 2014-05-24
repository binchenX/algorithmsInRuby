#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
//---------------
void exe_1_1();
int allUniq(char *s);
//----------------

void reverse(char *s);
void exe_1_2()
{
	char * s = malloc(strlen("hello")+1);
	memcpy(s,"hello",6);
	reverse(s);
	assert(strncmp(s,"olleh",5) == 0);
	free(s);
}

//---------
void reverse(char *s){
	
	int  l = strlen(s);
	int i = 0;
	printf("%s %d\n",s,l);
	for (i = 0 ; i <  l / 2; i++ ) {
		char t1 = s[i];
		char t2 = s[l - i - 1];
		s[i] = t2;
		s[l - i - 1] = t1;
	}

	printf("%s \n",s);
}


//---------

void exe_1_1(){

assert(allUniq("thanks")==1);
assert(allUniq("hello")==0);
assert(allUniq("heLlo")==0);

}


int allUniq(char *s){
	int mask = 0;
	const int MAX_LETTER = 26;
	int l = strlen(s);
	printf("%s %d \n",s, l);
 	if (l > MAX_LETTER) {
		return 0;
	}

	int i = 0 ;
	for (i = 0 ; i < l; i++) {
				int t = s[i];
				int c = (t >= 'A') ? t - 'A' : t - 'a';
				if (mask & (1 << c)) {
					return 0;
				}
				mask |= (1 << c);
	}
	return 1;
}
//-------

int isSubstring(const char *a, const char *b) {
	if (strstr(a,b) != NULL) {
		return 1;
	}
	return 0;
}

int isRotate(const char *a ,const char *b){

	int L = strlen(a);
	char *c = malloc(2*L+1);
	memcpy(c,a,L);
	memcpy(c+L,a,L);
	c[2*L] = '\0';
	int r = isSubstring(c,b);
	free(c);
	return r;

}

void exe_1_8(){
		assert(isRotate("waterbottle","erbottlewat"));
		assert(isRotate("waterbottle","drbottlewat"));
}
int main()
{
	exe_1_8();
	return 0;
}
