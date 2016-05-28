.class final Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
.super Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;
.source "PermissionColumns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CursorWrapper"
.end annotation


# instance fields
.field private hashCode:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;-><init>(J)V

    .line 42
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    .registers 7
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v5, -0x1

    .line 66
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 68
    const/4 v4, 0x0

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 69
    .local v0, "id":J
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;

    invoke-direct {v3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;-><init>(J)V

    .line 71
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    const-string v4, "perm_value"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 72
    .local v2, "index":I
    if-le v2, v5, :cond_1f

    .line 73
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->value:Ljava/lang/String;

    .line 76
    :cond_1f
    const-string v4, "perm_hash"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 77
    if-le v2, v5, :cond_2d

    .line 78
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->hashCode:Ljava/lang/String;

    .line 82
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    :cond_2d
    :goto_2d
    return-object v3

    :cond_2e
    const/4 v3, 0x0

    goto :goto_2d
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 54
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->getId()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;-><init>(J)V

    .line 55
    .local v0, "result":Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->hashCode:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->hashCode:Ljava/lang/String;

    .line 56
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->value:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->value:Ljava/lang/String;

    .line 57
    return-object v0
.end method

.method public getHashCode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->hashCode:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->value:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PermissionColumns.Permission{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;->hashCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
