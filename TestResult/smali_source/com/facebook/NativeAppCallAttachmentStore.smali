.class public final Lcom/facebook/NativeAppCallAttachmentStore;
.super Ljava/lang/Object;
.source "NativeAppCallAttachmentStore.java"

# interfaces
.implements Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static attachmentsDirectory:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    const-class v0, Lcom/facebook/NativeAppCallAttachmentStore;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/NativeAppCallAttachmentStore;->TAG:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getAttachmentFile(Ljava/util/UUID;Ljava/lang/String;Z)Ljava/io/File;
    .registers 9
    .param p1, "callId"    # Ljava/util/UUID;
    .param p2, "attachmentName"    # Ljava/lang/String;
    .param p3, "createDirs"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 211
    invoke-virtual {p0, p1, p3}, Lcom/facebook/NativeAppCallAttachmentStore;->getAttachmentsDirectoryForCall(Ljava/util/UUID;Z)Ljava/io/File;

    move-result-object v0

    .line 212
    .local v0, "dir":Ljava/io/File;
    if-nez v0, :cond_8

    .line 219
    :goto_7
    return-object v2

    .line 217
    :cond_8
    :try_start_8
    new-instance v3, Ljava/io/File;

    const-string v4, "UTF-8"

    invoke-static {p2, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8 .. :try_end_13} :catch_15

    move-object v2, v3

    goto :goto_7

    .line 218
    :catch_15
    move-exception v1

    .line 219
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    goto :goto_7
.end method

.method getAttachmentsDirectoryForCall(Ljava/util/UUID;Z)Ljava/io/File;
    .registers 6
    .param p1, "callId"    # Ljava/util/UUID;
    .param p2, "create"    # Z

    .prologue
    .line 199
    sget-object v1, Lcom/facebook/NativeAppCallAttachmentStore;->attachmentsDirectory:Ljava/io/File;

    if-nez v1, :cond_6

    .line 200
    const/4 v0, 0x0

    .line 207
    :cond_5
    :goto_5
    return-object v0

    .line 203
    :cond_6
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/facebook/NativeAppCallAttachmentStore;->attachmentsDirectory:Ljava/io/File;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 204
    .local v0, "dir":Ljava/io/File;
    if-eqz p2, :cond_5

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_5

    .line 205
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    goto :goto_5
.end method

.method public openAttachment(Ljava/util/UUID;Ljava/lang/String;)Ljava/io/File;
    .registers 5
    .param p1, "callId"    # Ljava/util/UUID;
    .param p2, "attachmentName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 171
    invoke-static {p2}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 172
    if-nez p1, :cond_e

    .line 173
    :cond_8
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1}, Ljava/io/FileNotFoundException;-><init>()V

    throw v1

    .line 177
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    invoke-virtual {p0, p1, p2, v1}, Lcom/facebook/NativeAppCallAttachmentStore;->getAttachmentFile(Ljava/util/UUID;Ljava/lang/String;Z)Ljava/io/File;
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_14

    move-result-object v1

    return-object v1

    .line 178
    :catch_14
    move-exception v0

    .line 181
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1}, Ljava/io/FileNotFoundException;-><init>()V

    throw v1
.end method
