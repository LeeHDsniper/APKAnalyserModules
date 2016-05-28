.class public final Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
.super Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;
.source "MessageColumns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MessageCursorWrapper"
.end annotation


# instance fields
.field identifier:Ljava/lang/String;

.field messageType:Ljava/lang/String;

.field versionKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;-><init>(J)V

    .line 23
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    .registers 7
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v5, -0x1

    .line 47
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 49
    const-string v4, "msg_id"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 50
    .local v0, "id":J
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;

    invoke-direct {v3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;-><init>(J)V

    .line 52
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    const-string v4, "msg_type"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 53
    .local v2, "index":I
    if-le v2, v5, :cond_24

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->messageType:Ljava/lang/String;

    .line 55
    :cond_24
    const-string v4, "msg_versionKey"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 56
    if-le v2, v5, :cond_32

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->versionKey:Ljava/lang/String;

    .line 58
    :cond_32
    const-string v4, "msg_identifier"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 59
    if-le v2, v5, :cond_40

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->identifier:Ljava/lang/String;

    .line 63
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    :cond_40
    :goto_40
    return-object v3

    :cond_41
    const/4 v3, 0x0

    goto :goto_40
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 27
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->id:J

    invoke-direct {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;-><init>(J)V

    .line 28
    .local v0, "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->messageType:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->messageType:Ljava/lang/String;

    .line 29
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->versionKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->versionKey:Ljava/lang/String;

    .line 30
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->identifier:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->identifier:Ljava/lang/String;

    .line 31
    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->messageType:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->versionKey:Ljava/lang/String;

    return-object v0
.end method
