.class public final Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
.super Ljava/lang/Object;
.source "TrayColumns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TrayCursorWrapper"
.end annotation


# instance fields
.field private displayName:Ljava/lang/String;

.field private free:Z

.field private final id:J

.field private identifier:Ljava/lang/String;

.field private installDate:Ljava/lang/String;

.field private packDisplayName:Ljava/lang/String;

.field private packId:J

.field private packageName:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private type:I


# direct methods
.method constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->id:J

    .line 55
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    .registers 8
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v4, 0x1

    const/4 v6, -0x1

    .line 98
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v5

    if-eqz v5, :cond_9a

    .line 99
    const-string v5, "_id"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 102
    .local v0, "id":J
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-direct {v3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;-><init>(J)V

    .line 104
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    const-string v5, "displayName"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 105
    .local v2, "index":I
    if-le v2, v6, :cond_25

    .line 106
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->displayName:Ljava/lang/String;

    .line 109
    :cond_25
    const-string v5, "identifier"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 110
    if-le v2, v6, :cond_33

    .line 111
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->identifier:Ljava/lang/String;

    .line 114
    :cond_33
    const-string v5, "type"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 115
    if-le v2, v6, :cond_41

    .line 116
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    iput v5, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->type:I

    .line 119
    :cond_41
    const-string v5, "path"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 120
    if-le v2, v6, :cond_4f

    .line 121
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->path:Ljava/lang/String;

    .line 124
    :cond_4f
    const-string v5, "packagename"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 125
    if-le v2, v6, :cond_5d

    .line 126
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->packageName:Ljava/lang/String;

    .line 129
    :cond_5d
    const-string v5, "installDate"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 130
    if-le v2, v6, :cond_6b

    .line 131
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->installDate:Ljava/lang/String;

    .line 134
    :cond_6b
    const-string v5, "isFree"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 135
    if-le v2, v6, :cond_7b

    .line 136
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    if-ne v5, v4, :cond_98

    :goto_79
    iput-boolean v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->free:Z

    .line 139
    :cond_7b
    const-string v4, "packId"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 140
    if-le v2, v6, :cond_89

    .line 141
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->packId:J

    .line 144
    :cond_89
    const-string v4, "packDisplayName"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 145
    if-le v2, v6, :cond_97

    .line 146
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->packDisplayName:Ljava/lang/String;

    .line 151
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    :cond_97
    :goto_97
    return-object v3

    .line 136
    .restart local v0    # "id":J
    .restart local v2    # "index":I
    .restart local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    :cond_98
    const/4 v4, 0x0

    goto :goto_79

    .line 151
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    :cond_9a
    const/4 v3, 0x0

    goto :goto_97
.end method


# virtual methods
.method public getId()J
    .registers 3

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->id:J

    return-wide v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getPackId()J
    .registers 3

    .prologue
    .line 94
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->packId:J

    return-wide v0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->path:Ljava/lang/String;

    return-object v0
.end method
