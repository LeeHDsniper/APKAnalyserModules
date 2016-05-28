.class public final Lcom/facebook/android/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public static decodeUrl(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v4, 0x0

    .line 98
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 99
    .local v2, "params":Landroid/os/Bundle;
    if-eqz p0, :cond_12

    .line 100
    const-string v5, "&"

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "array":[Ljava/lang/String;
    array-length v5, v0

    :goto_10
    if-lt v4, v5, :cond_13

    .line 116
    .end local v0    # "array":[Ljava/lang/String;
    :cond_12
    return-object v2

    .line 101
    .restart local v0    # "array":[Ljava/lang/String;
    :cond_13
    aget-object v1, v0, v4

    .line 102
    .local v1, "parameter":Ljava/lang/String;
    const-string v6, "="

    invoke-virtual {v1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 105
    .local v3, "v":[Ljava/lang/String;
    :try_start_1b
    array-length v6, v3

    const/4 v7, 0x2

    if-ne v6, v7, :cond_37

    .line 106
    const/4 v6, 0x0

    aget-object v6, v3, v6

    const-string v7, "UTF-8"

    invoke-static {v6, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 107
    const/4 v7, 0x1

    aget-object v7, v3, v7

    const-string v8, "UTF-8"

    invoke-static {v7, v8}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 106
    invoke-virtual {v2, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    :cond_34
    :goto_34
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 108
    :cond_37
    array-length v6, v3

    if-ne v6, v9, :cond_34

    .line 109
    const/4 v6, 0x0

    aget-object v6, v3, v6

    const-string v7, "UTF-8"

    invoke-static {v6, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v2, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_48
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1b .. :try_end_48} :catch_49

    goto :goto_34

    .line 111
    :catch_49
    move-exception v6

    goto :goto_34
.end method

.method public static parseUrl(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 6
    .param p0, "url"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 128
    const-string v3, "fbconnect"

    const-string v4, "http"

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 130
    :try_start_8
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 131
    .local v2, "u":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/android/Util;->decodeUrl(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 132
    .local v0, "b":Landroid/os/Bundle;
    invoke-virtual {v2}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/android/Util;->decodeUrl(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V
    :try_end_20
    .catch Ljava/net/MalformedURLException; {:try_start_8 .. :try_end_20} :catch_21

    .line 135
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v2    # "u":Ljava/net/URL;
    :goto_20
    return-object v0

    .line 134
    :catch_21
    move-exception v1

    .line 135
    .local v1, "e":Ljava/net/MalformedURLException;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    goto :goto_20
.end method
