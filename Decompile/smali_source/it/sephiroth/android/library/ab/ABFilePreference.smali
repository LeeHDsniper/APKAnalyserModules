.class Lit/sephiroth/android/library/ab/ABFilePreference;
.super Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;
.source "ABFilePreference.java"


# instance fields
.field final uuid:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16
    invoke-direct {p0}, Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;-><init>()V

    .line 17
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/ab/ABFilePreference;->generate(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/ab/ABFilePreference;->uuid:Ljava/lang/String;

    .line 18
    return-void
.end method

.method private createFile(Ljava/io/File;)Ljava/lang/String;
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0}, Lit/sephiroth/android/library/ab/ABFilePreference;->generateNew()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "uuid":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 45
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 46
    .local v0, "stream":Ljava/io/FileOutputStream;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 47
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 48
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 49
    return-object v1
.end method

.method private generate(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 27
    .local v1, "filesdir":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "ab"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 29
    .local v2, "parent":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_14

    .line 30
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 33
    :cond_14
    new-instance v0, Ljava/io/File;

    const-string v3, ".alpha-beta"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 35
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_26

    .line 36
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/ab/ABFilePreference;->createFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    .line 38
    :goto_25
    return-object v3

    :cond_26
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/ab/ABFilePreference;->readFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    goto :goto_25
.end method

.method private readFile(Ljava/io/File;)Ljava/lang/String;
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 54
    .local v0, "stream":Ljava/io/FileInputStream;
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/ab/ABFilePreference;->readStream(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "uuid":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 56
    return-object v1
.end method

.method private readStream(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .param p1, "pInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/util/Scanner;

    invoke-direct {v1, p1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    .line 62
    .local v1, "sc":Ljava/util/Scanner;
    :goto_a
    invoke-virtual {v1}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 63
    invoke-virtual {v1}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 65
    :cond_18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public getUUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 22
    iget-object v0, p0, Lit/sephiroth/android/library/ab/ABFilePreference;->uuid:Ljava/lang/String;

    return-object v0
.end method
