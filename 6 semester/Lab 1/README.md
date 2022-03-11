## Работа с текстом в BASH
# Команда
<pre>
<code>
cat file1.txt | tail -n 40 > file2.txt && head -n 10 file2.txt > file3.txt \
&& cat file2.txt | grep коко > temp.txt \
&& cat temp.txt | sed 's/коко/куку/g' | head -n 3 >> file3.txt \
&& rm -f temp.txt \
&& sort file3.txt | uniq -c > file3.txt && cat file3.txt
</code>
</pre>

# Результат
<img src="result.png">
