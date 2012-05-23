//
// strip multiple occurences of 0x0d from a dump file
//



#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main (int argc, char **argv) {

char *infile;
char *outfile;
char ifname[64];
char ofname[64];

FILE *ifp;
FILE *ofp;

char ch;
int crCount = 0;

	if (argc == 2) {
		printf("Usage: StripCr infile outfile\n");
		return 1;

	} else if (argc == 1) {
		printf("\n Input file: ");
		scanf("%s",ifname);
		printf("\n Output file: ");
		scanf("%s",ofname);
		infile = ifname;
		outfile = ofname;

	} else {
		infile = argv[1];
		outfile = argv[2];
	}

	ifp = fopen(infile,"rb");
//	fseek(ifp,0,SEEK_SET);

	if (!ifp) {
		printf(" unable to open source file %s\n", infile);
		return 1;
	}
	ofp = fopen(outfile,"wb");
	if (!ofp) {
		printf(" unable to open destination file %s\n", outfile);
		fclose(ifp);
		return (1);
	}

	while (1)  {
		ch = fgetc(ifp);
		if (ch == EOF) {
			break;
		}
		if (ch == 0x0d) {
			crCount++;
			if(crCount > 1 ) {
			 continue;
			}
		} else {
			crCount = 0;
		}

		fputc(ch,ofp);
	}
	fclose(ifp);
	fclose(ofp);
	return 0;
}
