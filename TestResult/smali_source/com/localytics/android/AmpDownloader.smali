.class Lcom/localytics/android/AmpDownloader;
.super Ljava/lang/Object;
.source "AmpDownloader.java"


# direct methods
.method public static downloadFile(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 22
    .param p0, "remoteFilePath"    # Ljava/lang/String;
    .param p1, "localFilePath"    # Ljava/lang/String;
    .param p2, "isOverwrite"    # Z

    .prologue
    .line 31
    move-object/from16 v10, p1

    .line 33
    .local v10, "result":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 34
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_31

    if-nez p2, :cond_31

    .line 36
    sget-boolean v14, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v14, :cond_30

    .line 38
    const-string v14, "Localytics"

    const-string v15, "The file %s does exist and overwrite is turned off."

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .end local p1    # "localFilePath":Ljava/lang/String;
    :cond_30
    :goto_30
    return-object p1

    .line 43
    .restart local p1    # "localFilePath":Ljava/lang/String;
    :cond_31
    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 44
    .local v4, "dir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v14

    if-nez v14, :cond_63

    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v14

    if-nez v14, :cond_63

    .line 46
    sget-boolean v14, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v14, :cond_60

    .line 48
    const-string v14, "Localytics"

    const-string v15, "Could not create the directory %s for saving file."

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :cond_60
    const/16 p1, 0x0

    goto :goto_30

    .line 56
    :cond_63
    :try_start_63
    new-instance v11, Ljava/io/File;

    const-string v14, "%s_temp"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object p1, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .local v11, "tempFile":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->createNewFile()Z

    .line 59
    new-instance v13, Ljava/net/URL;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 60
    .local v13, "url":Ljava/net/URL;
    invoke-virtual {v13}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v12

    .line 65
    .local v12, "ucon":Ljava/net/URLConnection;
    const/16 v1, 0x2000

    .line 66
    .local v1, "BUF_SIZE":I
    invoke-virtual {v12}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 67
    .local v8, "is":Ljava/io/InputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    const/16 v14, 0x4000

    invoke-direct {v2, v8, v14}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 68
    .local v2, "bis":Ljava/io/BufferedInputStream;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-virtual {v11}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v7, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 70
    .local v7, "fos":Ljava/io/FileOutputStream;
    const/4 v9, 0x0

    .line 71
    .local v9, "read":I
    const/16 v14, 0x2000

    new-array v3, v14, [B

    .line 73
    .local v3, "buffer":[B
    :goto_9e
    invoke-virtual {v2, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9

    const/4 v14, -0x1

    if-eq v9, v14, :cond_bb

    .line 75
    const/4 v14, 0x0

    invoke-virtual {v7, v3, v14, v9}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_a9} :catch_aa

    goto :goto_9e

    .line 85
    .end local v1    # "BUF_SIZE":I
    .end local v2    # "bis":Ljava/io/BufferedInputStream;
    .end local v3    # "buffer":[B
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "is":Ljava/io/InputStream;
    .end local v9    # "read":I
    .end local v11    # "tempFile":Ljava/io/File;
    .end local v12    # "ucon":Ljava/net/URLConnection;
    .end local v13    # "url":Ljava/net/URL;
    :catch_aa
    move-exception v5

    .line 87
    .local v5, "e":Ljava/io/IOException;
    sget-boolean v14, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v14, :cond_b6

    .line 89
    const-string v14, "Localytics"

    const-string v15, "AMP campaign not found. Creating a new one."

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_b6
    const/4 v10, 0x0

    .end local v5    # "e":Ljava/io/IOException;
    :cond_b7
    move-object/from16 p1, v10

    .line 94
    goto/16 :goto_30

    .line 77
    .restart local v1    # "BUF_SIZE":I
    .restart local v2    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "buffer":[B
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "is":Ljava/io/InputStream;
    .restart local v9    # "read":I
    .restart local v11    # "tempFile":Ljava/io/File;
    .restart local v12    # "ucon":Ljava/net/URLConnection;
    .restart local v13    # "url":Ljava/net/URL;
    :cond_bb
    :try_start_bb
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 79
    invoke-virtual {v11, v6}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v14

    if-nez v14, :cond_b7

    .line 81
    invoke-virtual {v11}, Ljava/io/File;->delete()Z
    :try_end_c7
    .catch Ljava/io/IOException; {:try_start_bb .. :try_end_c7} :catch_aa

    .line 82
    const/16 p1, 0x0

    goto/16 :goto_30
.end method

.method public static getAmpDataDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    const-string v1, ".localytics"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getLocalFileURL(Landroid/content/Context;Ljava/lang/String;JZ)Ljava/lang/String;
    .registers 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apiKey"    # Ljava/lang/String;
    .param p2, "ruleId"    # J
    .param p4, "isZipped"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-static {p0, p1}, Lcom/localytics/android/AmpDownloader;->getAmpDataDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    if-eqz p4, :cond_2b

    .line 140
    const-string v3, "amp_rule_%d.zip"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    :goto_26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2a
    return-object v3

    .line 144
    :cond_2b
    const-string v3, "amp_rule_%d"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 148
    .local v2, "path":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 151
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_51

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_70

    .line 153
    :cond_51
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_70

    .line 155
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_6e

    .line 157
    const-string v3, "Localytics"

    const-string v4, "Could not create the directory %s for saving the HTML file."

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :cond_6e
    const/4 v3, 0x0

    goto :goto_2a

    .line 163
    :cond_70
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    const-string v3, "index.html"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26
.end method

.method public static getRemoteFileURL(Ljava/util/Map;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 107
    .local v1, "url":Ljava/lang/String;
    const-string v2, "devices"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "devices":Ljava/lang/String;
    const-string v2, "tablet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 111
    const-string v2, "tablet_location"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 122
    :goto_15
    return-object v1

    .line 113
    :cond_16
    const-string v2, "both"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 115
    const-string v2, "phone_location"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_15

    .line 119
    :cond_25
    const-string v2, "phone_location"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_15
.end method
