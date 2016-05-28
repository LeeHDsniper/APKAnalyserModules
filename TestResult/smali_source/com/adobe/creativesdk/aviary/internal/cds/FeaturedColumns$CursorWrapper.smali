.class public final Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;
.super Ljava/lang/Object;
.source "FeaturedColumns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CursorWrapper"
.end annotation


# instance fields
.field private contentPath:Ljava/lang/String;

.field private displayName:Ljava/lang/String;

.field private featureImageLocalPath:Ljava/lang/String;

.field private featureURL:Ljava/lang/String;

.field private free:I

.field private iconPath:Ljava/lang/String;

.field private final id:J

.field private identifier:Ljava/lang/String;

.field private isFreeWithLogin:I

.field private packType:Ljava/lang/String;

.field private purchased:I

.field private type:I


# direct methods
.method constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->id:J

    .line 45
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;
    .registers 7
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v5, -0x1

    .line 100
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v4

    if-eqz v4, :cond_b1

    .line 101
    const-string v4, "_id"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 104
    .local v0, "id":J
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;

    invoke-direct {v3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;-><init>(J)V

    .line 106
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;
    const-string v4, "displayName"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 107
    .local v2, "index":I
    if-le v2, v5, :cond_24

    .line 108
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->displayName:Ljava/lang/String;

    .line 111
    :cond_24
    const-string v4, "identifier"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 112
    if-le v2, v5, :cond_32

    .line 113
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->identifier:Ljava/lang/String;

    .line 116
    :cond_32
    const-string v4, "type"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 117
    if-le v2, v5, :cond_40

    .line 118
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->type:I

    .line 121
    :cond_40
    const-string v4, "iconPath"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 122
    if-le v2, v5, :cond_4e

    .line 123
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->iconPath:Ljava/lang/String;

    .line 126
    :cond_4e
    const-string v4, "packType"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 127
    if-le v2, v5, :cond_5c

    .line 128
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->packType:Ljava/lang/String;

    .line 131
    :cond_5c
    const-string v4, "free"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 132
    if-le v2, v5, :cond_6a

    .line 133
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->free:I

    .line 136
    :cond_6a
    const-string v4, "purchased"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 137
    if-le v2, v5, :cond_78

    .line 138
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->purchased:I

    .line 141
    :cond_78
    const-string v4, "contentPath"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 142
    if-le v2, v5, :cond_86

    .line 143
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->contentPath:Ljava/lang/String;

    .line 146
    :cond_86
    const-string v4, "featureURL"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 147
    if-le v2, v5, :cond_94

    .line 148
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->featureURL:Ljava/lang/String;

    .line 151
    :cond_94
    const-string v4, "featureisFreeWithLogin"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 152
    if-le v2, v5, :cond_a2

    .line 153
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->isFreeWithLogin:I

    .line 156
    :cond_a2
    const-string v4, "featureImageLocalPath"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 157
    if-le v2, v5, :cond_b0

    .line 158
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->featureImageLocalPath:Ljava/lang/String;

    .line 163
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;
    :cond_b0
    :goto_b0
    return-object v3

    :cond_b1
    const/4 v3, 0x0

    goto :goto_b0
.end method


# virtual methods
.method public getFeatureImageLocalPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->featureImageLocalPath:Ljava/lang/String;

    return-object v0
.end method

.method public getId()J
    .registers 3

    .prologue
    .line 56
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->id:J

    return-wide v0
.end method
