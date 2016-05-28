.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;
.super Ljava/lang/Object;
.source "CdsManifestPermissionConsumer.java"


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const-string v0, "CdsManifestPermissionConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mContext:Landroid/content/Context;

    .line 29
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 30
    return-void
.end method


# virtual methods
.method consume()V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException;
        }
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mContext:Landroid/content/Context;

    const-string v2, "permissions/list"

    .line 36
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 38
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 39
    .local v8, "needUpdate":Z
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getPermissionsKey()Ljava/lang/String;

    move-result-object v9

    .line 40
    .local v9, "newPermissionKey":Ljava/lang/String;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getPermissions()Ljava/util/List;

    move-result-object v10

    .line 42
    .local v10, "newPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v6, :cond_52

    .line 43
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 44
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;

    move-result-object v14

    .line 45
    .local v14, "wrapper":Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    if-eqz v14, :cond_4f

    .line 46
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "old permissions: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->getValue()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 47
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->getHashCode()Ljava/lang/String;

    move-result-object v7

    .line 48
    .local v7, "hashCode":Ljava/lang/String;
    if-eqz v7, :cond_4f

    .line 49
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a3

    const/4 v8, 0x1

    .line 53
    .end local v7    # "hashCode":Ljava/lang/String;
    .end local v14    # "wrapper":Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    :cond_4f
    :goto_4f
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 56
    :cond_52
    if-eqz v8, :cond_8f

    .line 57
    const-string v0, ","

    invoke-static {v10, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/StringUtils;->join(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 58
    .local v11, "permissionString":Ljava/lang/String;
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "permissionString: \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v11, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 61
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 62
    .local v13, "values":Landroid/content/ContentValues;
    const-string v0, "perm_value"

    invoke-virtual {v13, v0, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    const-string v0, "perm_hash"

    invoke-virtual {v13, v0, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mContext:Landroid/content/Context;

    .line 65
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mContext:Landroid/content/Context;

    const-string v2, "permissions/replace"

    .line 66
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 65
    invoke-virtual {v0, v1, v13}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v12

    .line 69
    .local v12, "resultUri":Landroid/net/Uri;
    if-eqz v12, :cond_8f

    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPermissionsUpdated(Landroid/content/Context;)V

    .line 75
    .end local v11    # "permissionString":Ljava/lang/String;
    .end local v12    # "resultUri":Landroid/net/Uri;
    .end local v13    # "values":Landroid/content/ContentValues;
    :cond_8f
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->kill:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->name()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a5

    .line 76
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException;

    const-string v1, "This Application has been banned!"

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    .restart local v7    # "hashCode":Ljava/lang/String;
    .restart local v14    # "wrapper":Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    :cond_a3
    const/4 v8, 0x0

    goto :goto_4f

    .line 78
    .end local v7    # "hashCode":Ljava/lang/String;
    .end local v14    # "wrapper":Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    :cond_a5
    return-void
.end method
