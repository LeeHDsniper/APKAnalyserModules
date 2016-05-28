.class public Lcom/facebook/NativeAppCallContentProvider;
.super Landroid/content/ContentProvider;
.source "NativeAppCallContentProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final dataSource:Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    const-class v0, Lcom/facebook/NativeAppCallContentProvider;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/NativeAppCallContentProvider;->TAG:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    new-instance v0, Lcom/facebook/NativeAppCallAttachmentStore;

    invoke-direct {v0}, Lcom/facebook/NativeAppCallAttachmentStore;-><init>()V

    invoke-direct {p0, v0}, Lcom/facebook/NativeAppCallContentProvider;-><init>(Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;)V

    .line 55
    return-void
.end method

.method constructor <init>(Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;)V
    .registers 2
    .param p1, "dataSource"    # Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;

    .prologue
    .line 57
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/facebook/NativeAppCallContentProvider;->dataSource:Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;

    .line 59
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "strings"    # [Ljava/lang/String;

    .prologue
    .line 96
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 86
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "contentValues"    # Landroid/content/ContentValues;

    .prologue
    .line 91
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x1

    return v0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 108
    invoke-virtual {p0, p1}, Lcom/facebook/NativeAppCallContentProvider;->parseCallIdAndAttachmentName(Landroid/net/Uri;)Landroid/util/Pair;

    move-result-object v0

    .line 109
    .local v0, "callIdAndAttachmentName":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/UUID;Ljava/lang/String;>;"
    if-nez v0, :cond_c

    .line 110
    new-instance v3, Ljava/io/FileNotFoundException;

    invoke-direct {v3}, Ljava/io/FileNotFoundException;-><init>()V

    throw v3

    .line 114
    :cond_c
    :try_start_c
    iget-object v5, p0, Lcom/facebook/NativeAppCallContentProvider;->dataSource:Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/util/UUID;

    iget-object v4, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-interface {v5, v3, v4}, Lcom/facebook/NativeAppCallContentProvider$AttachmentDataSource;->openAttachment(Ljava/util/UUID;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 116
    .local v2, "file":Ljava/io/File;
    const/high16 v3, 0x10000000

    invoke-static {v2, v3}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;
    :try_end_1f
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_1f} :catch_21

    move-result-object v3

    return-object v3

    .line 117
    .end local v2    # "file":Ljava/io/File;
    :catch_21
    move-exception v1

    .line 118
    .local v1, "exception":Ljava/io/FileNotFoundException;
    sget-object v3, Lcom/facebook/NativeAppCallContentProvider;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Got unexpected exception:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    throw v1
.end method

.method parseCallIdAndAttachmentName(Landroid/net/Uri;)Landroid/util/Pair;
    .registers 10
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 129
    .local v2, "callIdAndAttachmentName":Ljava/lang/String;
    const-string v6, "/"

    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 131
    .local v5, "parts":[Ljava/lang/String;
    const/4 v6, 0x0

    aget-object v3, v5, v6

    .line 132
    .local v3, "callIdString":Ljava/lang/String;
    const/4 v6, 0x1

    aget-object v0, v5, v6

    .line 133
    .local v0, "attachmentName":Ljava/lang/String;
    invoke-static {v3}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    .line 135
    .local v1, "callId":Ljava/util/UUID;
    new-instance v6, Landroid/util/Pair;

    invoke-direct {v6, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_1f

    .line 137
    .end local v0    # "attachmentName":Ljava/lang/String;
    .end local v1    # "callId":Ljava/util/UUID;
    .end local v2    # "callIdAndAttachmentName":Ljava/lang/String;
    .end local v3    # "callIdString":Ljava/lang/String;
    .end local v5    # "parts":[Ljava/lang/String;
    :goto_1e
    return-object v6

    .line 136
    :catch_1f
    move-exception v4

    .line 137
    .local v4, "exception":Ljava/lang/Exception;
    const/4 v6, 0x0

    goto :goto_1e
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "strings"    # [Ljava/lang/String;
    .param p3, "s"    # Ljava/lang/String;
    .param p4, "strings2"    # [Ljava/lang/String;
    .param p5, "s2"    # Ljava/lang/String;

    .prologue
    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "contentValues"    # Landroid/content/ContentValues;
    .param p3, "s"    # Ljava/lang/String;
    .param p4, "strings"    # [Ljava/lang/String;

    .prologue
    .line 101
    const/4 v0, 0x0

    return v0
.end method
