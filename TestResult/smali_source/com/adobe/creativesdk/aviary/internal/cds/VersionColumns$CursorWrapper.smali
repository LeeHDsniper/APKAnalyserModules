.class public Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
.super Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;
.source "VersionColumns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CursorWrapper"
.end annotation


# instance fields
.field private assetsBaseURL:Ljava/lang/String;

.field private versionKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;-><init>(J)V

    .line 45
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    .registers 7
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v5, -0x1

    .line 64
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 66
    const-string v4, "version_id"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 67
    .local v0, "id":J
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;

    invoke-direct {v3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;-><init>(J)V

    .line 69
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    const-string v4, "version_versionKey"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 70
    .local v2, "index":I
    if-le v2, v5, :cond_24

    .line 71
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->versionKey:Ljava/lang/String;

    .line 74
    :cond_24
    const-string v4, "version_assetsBaseURL"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 75
    if-le v2, v5, :cond_32

    .line 76
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->assetsBaseURL:Ljava/lang/String;

    .line 81
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    :cond_32
    :goto_32
    return-object v3

    :cond_33
    const/4 v3, 0x0

    goto :goto_32
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 57
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->id:J

    invoke-direct {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;-><init>(J)V

    .line 58
    .local v0, "result":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->assetsBaseURL:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->assetsBaseURL:Ljava/lang/String;

    .line 59
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->versionKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->versionKey:Ljava/lang/String;

    .line 60
    return-object v0
.end method

.method public getAssetsBaseURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->assetsBaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->versionKey:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "VersionColumns.Version{ id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->id:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", versionKey: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->versionKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", assetsBaseURL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->assetsBaseURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
