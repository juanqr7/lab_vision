# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/juanqr7/lab_vision/edit/master/lab0_intro/questions.md

2.  What is the output of the ``cal`` command?

        The output is the calendar of the actual month
        

# Homework Questions

1.  What is the ``grep``command?
    >  The grep command search for lines containing a given word or pattern into a given file or directory

2.  What is a *makefile*?
    >   Is a file that describes the relationships among files in a given program and declare commands for updating each of those files.

3.  What is *git*?
    >   Git is a distributed version control system, this is system that records changes to a file or set of files over time and allows specific versions to be recalled later. The advantage of Git is that repositories are copied exactly in every computer and server connected to it. 

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   Find looks a file for given name or path, -prune option skips the given directory to avoid descending to it. Example:
find . -path './Homeworks' -prune will look for paths except directory with the name Homeworks.

5.  Where is the file ``xxxxxx``
    >   Command find / -iname 'xxxxxx'. Looks for the file named 'xxxxxx' from the root. No paths were found 

6.  How many files with ``gnu`` in its name are in ``dir``
    >   Command find /usr/src -iname '*gnu*' looks in directory path /usr/src for any file containing the word gnu anywhere in the file name  

7.  How many files contain ``gpl`` inside in ``dir``
    >   Command grep "gpl" /usr/src | wc -l, looks in the directory /usr/src for files containing the word gpl, the output is counted by wc -l

8.  What does the ``cut`` command do?
    >   The cut command removes sections of each line of a file or files.

9.  What does the ``wget`` command do?
    >   The wget command downloads files over a network.

10.  What does the ``diff`` command do?
    >   The diff command analyzes two files and prints the lines that are different.

11.  How many users exist in *Guitaca*?
    >   Using command "cat /etc/passwd" on system *Guitaca*, taking output to a .txt file and using wc -l command on the .txt file, 48 users are found.

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   Using cut -f 1,7 -d':' /etc/passwd | sort -t':' -k2. First, information is taken from /etc/passwd and the 1 and 7 columns are cut using delimition as :, then fields are delimited again by ':' and the information is sorted alphabetically using the second field, which is shell. 

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   Using grep "/sbin/nologin" "/etc/passwd" | wc, grep highlights all words with the characters "/sbin/nologin" in "/etc/passwd" and then are counted by the wc command. 

14.  What is the name of the linux distribution running on *Guitaca*?
    >   Is fedora 20 (Heisenbug)

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github
Check script

16. How many unique images are in the ``sipi_images`` folder?
    >   215 images
    
