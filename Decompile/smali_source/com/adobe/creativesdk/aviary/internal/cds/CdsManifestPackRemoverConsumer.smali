.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;
.super Ljava/lang/Object;
.source "CdsManifestPackRemoverConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;
    }
.end annotation


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mException:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private final mOperations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

.field private final mRemovedPackTypes:Ljava/util/HashSet;
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
    .line 28
    const-string v0, "AviaryCdsManifestPackRemoverConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p3, "operations"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    .line 39
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 40
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mRemovedPackTypes:Ljava/util/HashSet;

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mException:Ljava/util/List;

    .line 42
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mOperations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .line 43
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$1;)V
    .registers 5
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p3, "x2"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    .param p4, "x3"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$1;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)V

    return-void
.end method

.method private deletePacks()V
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 99
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasContent()Z

    move-result v4

    if-eqz v4, :cond_a3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasDeletedPacks()Z

    move-result v4

    if-eqz v4, :cond_a3

    .line 100
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getDeletedPacks()Ljava/util/List;

    move-result-object v0

    .line 101
    .local v0, "deletedList":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1d
    :goto_1d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    .line 102
    .local v1, "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    if-eqz v1, :cond_1d

    .line 106
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "%s need to be hard removed"

    new-array v7, v12, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 108
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackByIdentifier(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v2

    .line 110
    .local v2, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    if-eqz v2, :cond_1d

    .line 111
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "pack/id/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 112
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/remove"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 111
    invoke-virtual {v5, v6, v10, v10}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    .line 114
    .local v3, "result":I
    if-lez v3, :cond_9a

    .line 116
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "removed %s, now remove its contents"

    new-array v7, v12, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 117
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mRemovedPackTypes:Ljava/util/HashSet;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 118
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mOperations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    if-eqz v5, :cond_96

    .line 119
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mOperations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->delete()V

    .line 121
    :cond_96
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->deletePackFiles(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)V

    goto :goto_1d

    .line 123
    :cond_9a
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "failed to remove entry. result = 0"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto/16 :goto_1d

    .line 131
    .end local v0    # "deletedList":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    .end local v1    # "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .end local v2    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v3    # "result":I
    :cond_a3
    return-void
.end method

.method private hidePacks()V
    .registers 12

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 137
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasContent()Z

    move-result v5

    if-eqz v5, :cond_ba

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasEnabledPacks()Z

    move-result v5

    if-eqz v5, :cond_ba

    .line 139
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "pack_id"

    aput-object v7, v6, v8

    const-string v7, "pack_identifier"

    aput-object v7, v6, v10

    const/4 v7, 0x2

    const-string v8, "pack_type"

    aput-object v8, v6, v7

    const-string v7, "pack_visible=1"

    invoke-static {v5, v6, v7, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPacksList(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 145
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_ba

    .line 147
    :cond_2d
    :goto_2d
    :try_start_2d
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_b7

    .line 148
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v2

    .line 149
    .local v2, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    if-eqz v2, :cond_2d

    .line 150
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->containsEnabledPack(Ljava/lang/String;)Z

    move-result v1

    .line 151
    .local v1, "exists":Z
    if-nez v1, :cond_2d

    .line 152
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "%s need to be hidden"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 154
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 155
    .local v4, "values":Landroid/content/ContentValues;
    const-string v5, "pack_visible"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 156
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "pack/id/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 157
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/update"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 156
    invoke-virtual {v5, v6, v4, v7, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    .line 160
    .local v3, "result":I
    if-lez v3, :cond_ae

    .line 161
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mRemovedPackTypes:Ljava/util/HashSet;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 162
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mOperations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    if-eqz v5, :cond_2d

    .line 163
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mOperations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hide()V
    :try_end_a8
    .catchall {:try_start_2d .. :try_end_a8} :catchall_a9

    goto :goto_2d

    .line 172
    .end local v1    # "exists":Z
    .end local v2    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v3    # "result":I
    .end local v4    # "values":Landroid/content/ContentValues;
    :catchall_a9
    move-exception v5

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v5

    .line 166
    .restart local v1    # "exists":Z
    .restart local v2    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .restart local v3    # "result":I
    .restart local v4    # "values":Landroid/content/ContentValues;
    :cond_ae
    :try_start_ae
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "failed to update entry. result = 0"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_b5
    .catchall {:try_start_ae .. :try_end_b5} :catchall_a9

    goto/16 :goto_2d

    .line 172
    .end local v1    # "exists":Z
    .end local v2    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v3    # "result":I
    .end local v4    # "values":Landroid/content/ContentValues;
    :cond_b7
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 176
    .end local v0    # "cursor":Landroid/database/Cursor;
    :cond_ba
    return-void
.end method


# virtual methods
.method consume()V
    .registers 3

    .prologue
    .line 85
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 88
    :try_start_3
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->deletePacks()V

    .line 89
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->hidePacks()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_9} :catch_a

    .line 93
    :goto_9
    return-void

    .line 90
    :catch_a
    move-exception v0

    .line 91
    .local v0, "t":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mException:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9
.end method

.method deletePackFiles(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)V
    .registers 6
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    .prologue
    .line 179
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackRootContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 180
    .local v2, "folderName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 186
    .local v1, "folderDir":Ljava/io/File;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteQuietly(Ljava/io/File;)Z

    move-result v0

    .line 191
    .local v0, "deleted":Z
    return-void
.end method

.method getExceptions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mException:Ljava/util/List;

    return-object v0
.end method

.method public getRemovedPacksType()Ljava/util/HashSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->mRemovedPackTypes:Ljava/util/HashSet;

    return-object v0
.end method
