.class public final Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
.super Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;
.source "MessageContentColumn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MessageContentCursorWrapper"
.end annotation


# instance fields
.field private actionButtonText:Ljava/lang/String;

.field private beginDate:Ljava/lang/String;

.field private contentIdentifier:Ljava/lang/String;

.field private contentPath:Ljava/lang/String;

.field private contentURL:Ljava/lang/String;

.field private dismissButtonText:Ljava/lang/String;

.field private endDate:Ljava/lang/String;

.field private layoutStyle:Ljava/lang/String;

.field private messageId:J

.field private paragraph:Ljava/lang/String;

.field private showNewBanner:Z

.field private title:Ljava/lang/String;

.field private visited:Z


# direct methods
.method public constructor <init>(JJ)V
    .registers 6
    .param p1, "id"    # J
    .param p3, "messageId"    # J

    .prologue
    .line 139
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;-><init>(J)V

    .line 140
    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->messageId:J

    .line 141
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    .registers 11
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v9, -0x1

    .line 145
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v6

    if-eqz v6, :cond_d4

    .line 147
    const-string v6, "msgcnt_id"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 148
    .local v0, "id":J
    const-string v6, "msgcnt_messageId"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 149
    .local v4, "messageId":J
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;

    invoke-direct {v3, v0, v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;-><init>(JJ)V

    .line 151
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    const-string v6, "msgcnt_contentIdentifier"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 152
    .local v2, "index":I
    if-le v2, v9, :cond_30

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentIdentifier:Ljava/lang/String;

    .line 154
    :cond_30
    const-string v6, "msgcnt_beginDate"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 155
    if-le v2, v9, :cond_3e

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->beginDate:Ljava/lang/String;

    .line 157
    :cond_3e
    const-string v6, "msgcnt_endDate"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 158
    if-le v2, v9, :cond_4c

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->endDate:Ljava/lang/String;

    .line 160
    :cond_4c
    const-string v6, "msgcnt_title"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 161
    if-le v2, v9, :cond_5a

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->title:Ljava/lang/String;

    .line 163
    :cond_5a
    const-string v6, "msgcnt_paragraph"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 164
    if-le v2, v9, :cond_68

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->paragraph:Ljava/lang/String;

    .line 166
    :cond_68
    const-string v6, "msgcnt_dismissButton"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 167
    if-le v2, v9, :cond_76

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->dismissButtonText:Ljava/lang/String;

    .line 169
    :cond_76
    const-string v6, "msgcnt_actionButton"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 170
    if-le v2, v9, :cond_84

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->actionButtonText:Ljava/lang/String;

    .line 172
    :cond_84
    const-string v6, "msgcnt_contentURL"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 173
    if-le v2, v9, :cond_92

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentURL:Ljava/lang/String;

    .line 175
    :cond_92
    const-string v6, "msgcnt_layoutStyle"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 176
    if-le v2, v9, :cond_a0

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->layoutStyle:Ljava/lang/String;

    .line 178
    :cond_a0
    const-string v6, "msgcnt_showNewBanner"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 179
    if-le v2, v9, :cond_b1

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    if-ne v6, v7, :cond_d0

    move v6, v7

    :goto_af
    iput-boolean v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->showNewBanner:Z

    .line 181
    :cond_b1
    const-string v6, "msgcnt_visited"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 182
    if-le v2, v9, :cond_c1

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    if-ne v6, v7, :cond_d2

    :goto_bf
    iput-boolean v7, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->visited:Z

    .line 184
    :cond_c1
    const-string v6, "msgcnt_contentPath"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 185
    if-le v2, v9, :cond_cf

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentPath:Ljava/lang/String;

    .line 189
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    .end local v4    # "messageId":J
    :cond_cf
    :goto_cf
    return-object v3

    .restart local v0    # "id":J
    .restart local v2    # "index":I
    .restart local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    .restart local v4    # "messageId":J
    :cond_d0
    move v6, v8

    .line 179
    goto :goto_af

    :cond_d2
    move v7, v8

    .line 182
    goto :goto_bf

    .line 189
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    .end local v4    # "messageId":J
    :cond_d4
    const/4 v3, 0x0

    goto :goto_cf
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 7

    .prologue
    .line 70
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->id:J

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->messageId:J

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;-><init>(JJ)V

    .line 71
    .local v0, "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentIdentifier:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentIdentifier:Ljava/lang/String;

    .line 72
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->beginDate:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->beginDate:Ljava/lang/String;

    .line 73
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->endDate:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->endDate:Ljava/lang/String;

    .line 74
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->title:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->title:Ljava/lang/String;

    .line 75
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->paragraph:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->paragraph:Ljava/lang/String;

    .line 76
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->dismissButtonText:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->dismissButtonText:Ljava/lang/String;

    .line 77
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->actionButtonText:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->actionButtonText:Ljava/lang/String;

    .line 78
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentURL:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentURL:Ljava/lang/String;

    .line 79
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->layoutStyle:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->layoutStyle:Ljava/lang/String;

    .line 80
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->showNewBanner:Z

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->showNewBanner:Z

    .line 81
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentPath:Ljava/lang/String;

    .line 82
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->visited:Z

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->visited:Z

    .line 83
    return-object v0
.end method

.method public getActionButtonText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->actionButtonText:Ljava/lang/String;

    return-object v0
.end method

.method public getBeginDate()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->beginDate:Ljava/lang/String;

    return-object v0
.end method

.method public getContentIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getContentPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentPath:Ljava/lang/String;

    return-object v0
.end method

.method public getContentURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->contentURL:Ljava/lang/String;

    return-object v0
.end method

.method public getDismissButtonText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->dismissButtonText:Ljava/lang/String;

    return-object v0
.end method

.method public getEndDate()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->endDate:Ljava/lang/String;

    return-object v0
.end method

.method public getLayoutStyle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->layoutStyle:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageId()J
    .registers 3

    .prologue
    .line 87
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->messageId:J

    return-wide v0
.end method

.method public getParagraph()Ljava/lang/String;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->paragraph:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->title:Ljava/lang/String;

    return-object v0
.end method

.method public isShowNewBanner()Z
    .registers 2

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->showNewBanner:Z

    return v0
.end method
