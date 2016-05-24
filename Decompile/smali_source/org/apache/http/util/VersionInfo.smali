.class public Lorg/apache/http/util/VersionInfo;
.super Ljava/lang/Object;
.source "VersionInfo.java"


# static fields
.field public static final PROPERTY_MODULE:Ljava/lang/String; = "info.module"

.field public static final PROPERTY_RELEASE:Ljava/lang/String; = "info.release"

.field public static final PROPERTY_TIMESTAMP:Ljava/lang/String; = "info.timestamp"

.field public static final UNAVAILABLE:Ljava/lang/String; = "UNAVAILABLE"

.field public static final VERSION_PROPERTY_FILE:Ljava/lang/String; = "version.properties"


# instance fields
.field private final infoClassloader:Ljava/lang/String;

.field private final infoModule:Ljava/lang/String;

.field private final infoPackage:Ljava/lang/String;

.field private final infoRelease:Ljava/lang/String;

.field private final infoTimestamp:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "pckg"    # Ljava/lang/String;
    .param p2, "module"    # Ljava/lang/String;
    .param p3, "release"    # Ljava/lang/String;
    .param p4, "time"    # Ljava/lang/String;
    .param p5, "clsldr"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    const-string v0, "Package identifier"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    iput-object p1, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    .line 92
    if-eqz p2, :cond_1b

    .end local p2    # "module":Ljava/lang/String;
    :goto_c
    iput-object p2, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    .line 93
    if-eqz p3, :cond_1e

    .end local p3    # "release":Ljava/lang/String;
    :goto_10
    iput-object p3, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    .line 94
    if-eqz p4, :cond_21

    .end local p4    # "time":Ljava/lang/String;
    :goto_14
    iput-object p4, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    .line 95
    if-eqz p5, :cond_24

    .end local p5    # "clsldr":Ljava/lang/String;
    :goto_18
    iput-object p5, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    .line 96
    return-void

    .line 92
    .restart local p2    # "module":Ljava/lang/String;
    .restart local p3    # "release":Ljava/lang/String;
    .restart local p4    # "time":Ljava/lang/String;
    .restart local p5    # "clsldr":Ljava/lang/String;
    :cond_1b
    const-string p2, "UNAVAILABLE"

    goto :goto_c

    .line 93
    .end local p2    # "module":Ljava/lang/String;
    :cond_1e
    const-string p3, "UNAVAILABLE"

    goto :goto_10

    .line 94
    .end local p3    # "release":Ljava/lang/String;
    :cond_21
    const-string p4, "UNAVAILABLE"

    goto :goto_14

    .line 95
    .end local p4    # "time":Ljava/lang/String;
    :cond_24
    const-string p5, "UNAVAILABLE"

    goto :goto_18
.end method

.method protected static fromMap(Ljava/lang/String;Ljava/util/Map;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;
    .registers 9
    .param p0, "pckg"    # Ljava/lang/String;
    .param p2, "clsldr"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<**>;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Lorg/apache/http/util/VersionInfo;"
        }
    .end annotation

    .prologue
    .local p1, "info":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const/4 v1, 0x1

    .line 268
    const-string v0, "Package identifier"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 269
    const/4 v2, 0x0

    .line 270
    .local v2, "module":Ljava/lang/String;
    const/4 v3, 0x0

    .line 271
    .local v3, "release":Ljava/lang/String;
    const/4 v4, 0x0

    .line 273
    .local v4, "timestamp":Ljava/lang/String;
    if-eqz p1, :cond_4e

    .line 274
    const-string v0, "info.module"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "module":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 275
    .restart local v2    # "module":Ljava/lang/String;
    if-eqz v2, :cond_1c

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v1, :cond_1c

    .line 276
    const/4 v2, 0x0

    .line 279
    :cond_1c
    const-string v0, "info.release"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "release":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 280
    .restart local v3    # "release":Ljava/lang/String;
    if-eqz v3, :cond_35

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_34

    const-string v0, "${pom.version}"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 282
    :cond_34
    const/4 v3, 0x0

    .line 285
    :cond_35
    const-string v0, "info.timestamp"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "timestamp":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 286
    .restart local v4    # "timestamp":Ljava/lang/String;
    if-eqz v4, :cond_4e

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_4d

    const-string v0, "${mvn.timestamp}"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 290
    :cond_4d
    const/4 v4, 0x0

    .line 294
    :cond_4e
    const/4 v5, 0x0

    .line 295
    .local v5, "clsldrstr":Ljava/lang/String;
    if-eqz p2, :cond_55

    .line 296
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 299
    :cond_55
    new-instance v0, Lorg/apache/http/util/VersionInfo;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/util/VersionInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getUserAgent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/String;
    .registers 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "pkg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 318
    .local p2, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {p1, v3}, Lorg/apache/http/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v2

    .line 319
    .local v2, "vi":Lorg/apache/http/util/VersionInfo;
    if-eqz v2, :cond_3c

    invoke-virtual {v2}, Lorg/apache/http/util/VersionInfo;->getRelease()Ljava/lang/String;

    move-result-object v1

    .line 320
    .local v1, "release":Ljava/lang/String;
    :goto_e
    const-string v3, "java.version"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 321
    .local v0, "javaVersion":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (Java 1.5 minimum; Java/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 319
    .end local v0    # "javaVersion":Ljava/lang/String;
    .end local v1    # "release":Ljava/lang/String;
    :cond_3c
    const-string v1, "UNAVAILABLE"

    goto :goto_e
.end method

.method public static loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;
    .registers 10
    .param p0, "pckg"    # Ljava/lang/String;
    .param p1, "clsldr"    # Ljava/lang/ClassLoader;

    .prologue
    .line 225
    const-string v5, "Package identifier"

    invoke-static {p0, v5}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 226
    if-eqz p1, :cond_44

    move-object v0, p1

    .line 228
    .local v0, "cl":Ljava/lang/ClassLoader;
    :goto_8
    const/4 v4, 0x0

    .line 232
    .local v4, "vip":Ljava/util/Properties;
    :try_start_9
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v6, 0x2e

    const/16 v7, 0x2f

    invoke-virtual {p0, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "version.properties"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_2d} :catch_52

    move-result-object v1

    .line 234
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_3c

    .line 236
    :try_start_30
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 237
    .local v2, "props":Ljava/util/Properties;
    invoke-virtual {v2, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_38
    .catchall {:try_start_30 .. :try_end_38} :catchall_4d

    .line 238
    move-object v4, v2

    .line 240
    :try_start_39
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3c} :catch_52

    .line 247
    .end local v1    # "is":Ljava/io/InputStream;
    .end local v2    # "props":Ljava/util/Properties;
    :cond_3c
    :goto_3c
    const/4 v3, 0x0

    .line 248
    .local v3, "result":Lorg/apache/http/util/VersionInfo;
    if-eqz v4, :cond_43

    .line 249
    invoke-static {p0, v4, v0}, Lorg/apache/http/util/VersionInfo;->fromMap(Ljava/lang/String;Ljava/util/Map;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v3

    .line 252
    :cond_43
    return-object v3

    .line 226
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v3    # "result":Lorg/apache/http/util/VersionInfo;
    .end local v4    # "vip":Ljava/util/Properties;
    :cond_44
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_8

    .line 240
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    .restart local v1    # "is":Ljava/io/InputStream;
    .restart local v4    # "vip":Ljava/util/Properties;
    :catchall_4d
    move-exception v5

    :try_start_4e
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v5
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_52} :catch_52

    .line 243
    .end local v1    # "is":Ljava/io/InputStream;
    :catch_52
    move-exception v5

    goto :goto_3c
.end method

.method public static loadVersionInfo([Ljava/lang/String;Ljava/lang/ClassLoader;)[Lorg/apache/http/util/VersionInfo;
    .registers 9
    .param p0, "pckgs"    # [Ljava/lang/String;
    .param p1, "clsldr"    # Ljava/lang/ClassLoader;

    .prologue
    .line 198
    const-string v6, "Package identifier array"

    invoke-static {p0, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 199
    new-instance v5, Ljava/util/ArrayList;

    array-length v6, p0

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 200
    .local v5, "vil":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/util/VersionInfo;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_e
    if-ge v1, v2, :cond_1e

    aget-object v3, v0, v1

    .line 201
    .local v3, "pckg":Ljava/lang/String;
    invoke-static {v3, p1}, Lorg/apache/http/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v4

    .line 202
    .local v4, "vi":Lorg/apache/http/util/VersionInfo;
    if-eqz v4, :cond_1b

    .line 203
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 207
    .end local v3    # "pckg":Ljava/lang/String;
    .end local v4    # "vi":Lorg/apache/http/util/VersionInfo;
    :cond_1e
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Lorg/apache/http/util/VersionInfo;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lorg/apache/http/util/VersionInfo;

    return-object v6
.end method


# virtual methods
.method public final getClassloader()Ljava/lang/String;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    return-object v0
.end method

.method public final getModule()Ljava/lang/String;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    return-object v0
.end method

.method public final getPackage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    return-object v0
.end method

.method public final getRelease()Ljava/lang/String;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    return-object v0
.end method

.method public final getTimestamp()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    const/16 v3, 0x3a

    .line 159
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x14

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 164
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "VersionInfo("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    const-string v1, "UNAVAILABLE"

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    .line 170
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    :cond_53
    const-string v1, "UNAVAILABLE"

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_66

    .line 173
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    :cond_66
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 178
    const-string v1, "UNAVAILABLE"

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_80

    .line 179
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    :cond_80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
