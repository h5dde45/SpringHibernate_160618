<html>
<head>
    <title>Books Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<a href="/">Back to main menu</a>

<br/>
<br/>

<h1>Book List</h1>

<#if listBooks?has_content>
<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Title</th>
        <th width="120">Author</th>
        <th width="120">Price</th>
        <th width="60">Edit</th>
        <th width="60">Delete</th>
    </tr>
    <#list listBooks as book>
        <tr>
            <td>${book.id}</td>
            <td><a href="/bookdata/${book.id}">${book.bookTitle}</a></td>
            <td>${book.bookAuthor}</td>
            <td>${book.bookPrice/100}</td>
            <td><a href="/edit/${book.id}">Edit</a></td>
            <td><a href="/remove/${book.id}">Delete</a></td>
        </tr>
    </#list>
</table>
</#if>



<#if !book.bookTitle?has_content>
    <#assign name="Add book">
    <#assign button="Add">
<#else >
    <#assign name="Edit book">
    <#assign button="Edit">
</#if>

<h2>${name}</h2>
<form name="book" action="/books/add" method="post">
    <table>
    <#if book.bookTitle?has_content>
        <tr>
            <td>Id</td>
            <td>
                <input type="text" name="id" value="${book.id}" readonly>
            </td>
        </tr>
    </#if>
        <tr>
            <td>BookTitle</td>
            <td>
                <input type="text" name="bookTitle" value="${book.bookTitle}">
            </td>
        </tr>
        <tr>
            <td>BookAuthor</td>
            <td>
                <input type="text" name="bookAuthor" value="${book.bookAuthor}">
            </td>
        </tr>
        <tr>
            <td>BookPrice</td>
            <td>
                <input type="text" name="bookPrice" value="${book.bookPrice}">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="${button}">
            </td>
        </tr>

    </table>
</form>
</body>
</html>