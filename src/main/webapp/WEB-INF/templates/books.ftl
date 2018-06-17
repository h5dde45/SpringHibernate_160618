<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>hello</title>
</head>
<body>
<#list books as book>
<p>${book.id}</p>
<p>${book.bookTitle}</p>
<p>${book.bookAuthor}</p>
<p>${book.bookPrice}</p>
<hr/>
</#list>
</body>
</html>