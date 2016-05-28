.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;
.super Ljava/lang/Object;
.source "CdsManifestMessagesRemoverConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;
    }
.end annotation


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private final mRemovedMessageTypes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-string v0, "AviaryCdsManifestPackRemoverConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mContext:Landroid/content/Context;

    .line 29
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 30
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mRemovedMessageTypes:Ljava/util/HashSet;

    .line 31
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$1;)V
    .registers 4
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p3, "x2"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$1;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V

    return-void
.end method


# virtual methods
.method consume()V
    .registers 15

    .prologue
    const/4 v2, 0x0

    .line 66
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_110

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mContext:Landroid/content/Context;

    const-string v3, "message/list"

    .line 70
    invoke-static {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    .line 69
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 72
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_110

    .line 74
    :cond_23
    :goto_23
    :try_start_23
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_10d

    .line 75
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;

    move-result-object v11

    .line 76
    .local v11, "message":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    if-eqz v11, :cond_23

    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->containsMessage(Ljava/lang/String;)Z

    move-result v10

    .line 78
    .local v10, "exists":Z
    if-nez v10, :cond_23

    .line 79
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "%s need to be removed"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 80
    const/4 v7, 0x0

    .line 82
    .local v7, "contentPath":Ljava/lang/String;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mContext:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "message/id/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 84
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/content"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "msgcnt_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "msgcnt_messageId"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "msgcnt_contentPath"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 82
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_8e
    .catchall {:try_start_23 .. :try_end_8e} :catchall_fa

    move-result-object v6

    .line 89
    .local v6, "contentCursor":Landroid/database/Cursor;
    if-eqz v6, :cond_a2

    .line 91
    :try_start_91
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_9f

    .line 93
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;

    move-result-object v12

    .line 94
    .local v12, "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentPath()Ljava/lang/String;
    :try_end_9e
    .catchall {:try_start_91 .. :try_end_9e} :catchall_ff

    move-result-object v7

    .line 97
    .end local v12    # "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    :cond_9f
    :try_start_9f
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 102
    :cond_a2
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mContext:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "message/id/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 104
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/remove"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 102
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v13

    .line 107
    .local v13, "result":I
    if-lez v13, :cond_104

    .line 109
    if-eqz v7, :cond_ef

    .line 110
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteQuietly(Ljava/io/File;)Z

    move-result v9

    .line 111
    .local v9, "deleted":Z
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "deleted content path: %b"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    .end local v9    # "deleted":Z
    :cond_ef
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->mRemovedMessageTypes:Ljava/util/HashSet;

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getMessageType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_f8
    .catchall {:try_start_9f .. :try_end_f8} :catchall_fa

    goto/16 :goto_23

    .line 123
    .end local v6    # "contentCursor":Landroid/database/Cursor;
    .end local v7    # "contentPath":Ljava/lang/String;
    .end local v10    # "exists":Z
    .end local v11    # "message":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    .end local v13    # "result":I
    :catchall_fa
    move-exception v0

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    .line 97
    .restart local v6    # "contentCursor":Landroid/database/Cursor;
    .restart local v7    # "contentPath":Ljava/lang/String;
    .restart local v10    # "exists":Z
    .restart local v11    # "message":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    :catchall_ff
    move-exception v0

    :try_start_100
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    .line 117
    .restart local v13    # "result":I
    :cond_104
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "failed to remove message entry. result = 0"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_10b
    .catchall {:try_start_100 .. :try_end_10b} :catchall_fa

    goto/16 :goto_23

    .line 123
    .end local v6    # "contentCursor":Landroid/database/Cursor;
    .end local v7    # "contentPath":Ljava/lang/String;
    .end local v10    # "exists":Z
    .end local v11    # "message":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    .end local v13    # "result":I
    :cond_10d
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 127
    .end local v8    # "cursor":Landroid/database/Cursor;
    :cond_110
    return-void
.end method
