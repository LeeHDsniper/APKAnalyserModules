.class public final Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
.super Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;
.source "PacksColumns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PackCursorWrapper"
.end annotation


# instance fields
.field content:Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

.field creationDate:Ljava/lang/String;

.field displayOrder:I

.field identifier:Ljava/lang/String;

.field markedForDeletion:I

.field packType:Ljava/lang/String;

.field versionKey:Ljava/lang/String;

.field visible:I


# direct methods
.method constructor <init>(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;-><init>(J)V

    .line 61
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .registers 7
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v5, -0x1

    .line 129
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v4

    if-eqz v4, :cond_79

    .line 132
    const-string v4, "pack_id"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 134
    .local v2, "id":J
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;-><init>(J)V

    .line 136
    .local v1, "result":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    const-string v4, "pack_identifier"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 137
    .local v0, "columnIndex":I
    if-le v0, v5, :cond_24

    .line 138
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->identifier:Ljava/lang/String;

    .line 141
    :cond_24
    const-string v4, "pack_versionKey"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 142
    if-le v0, v5, :cond_32

    .line 143
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->versionKey:Ljava/lang/String;

    .line 146
    :cond_32
    const-string v4, "pack_type"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 147
    if-le v0, v5, :cond_40

    .line 148
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->packType:Ljava/lang/String;

    .line 151
    :cond_40
    const-string v4, "pack_markedForDeletion"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 152
    if-le v0, v5, :cond_4e

    .line 153
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->markedForDeletion:I

    .line 156
    :cond_4e
    const-string v4, "pack_visible"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 157
    if-le v0, v5, :cond_5c

    .line 158
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->visible:I

    .line 161
    :cond_5c
    const-string v4, "pack_displayOrder"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 162
    if-le v0, v5, :cond_6a

    .line 163
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->displayOrder:I

    .line 166
    :cond_6a
    const-string v4, "pack_creationDate"

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 167
    if-le v0, v5, :cond_78

    .line 168
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->creationDate:Ljava/lang/String;

    .line 173
    .end local v0    # "columnIndex":I
    .end local v1    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v2    # "id":J
    :cond_78
    :goto_78
    return-object v1

    :cond_79
    const/4 v1, 0x0

    goto :goto_78
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 65
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->id:J

    invoke-direct {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;-><init>(J)V

    .line 66
    .local v0, "result":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->identifier:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->identifier:Ljava/lang/String;

    .line 67
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->packType:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->packType:Ljava/lang/String;

    .line 68
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->versionKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->versionKey:Ljava/lang/String;

    .line 69
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->displayOrder:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->displayOrder:I

    .line 70
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->visible:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->visible:I

    .line 71
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->creationDate:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->creationDate:Ljava/lang/String;

    .line 72
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->markedForDeletion:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->markedForDeletion:I

    .line 73
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->content:Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    if-eqz v1, :cond_31

    .line 74
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->content:Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->content:Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .line 76
    :cond_31
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 81
    if-nez p1, :cond_4

    .line 84
    :cond_3
    :goto_3
    return v1

    .line 82
    :cond_4
    instance-of v2, p1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    if-eqz v2, :cond_3

    move-object v0, p1

    .line 83
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .line 84
    .local v0, "other":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->id:J

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->id:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    const/4 v1, 0x1

    goto :goto_3
.end method

.method public getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->content:Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    return-object v0
.end method

.method public getDisplayOrder()I
    .registers 2

    .prologue
    .line 117
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->displayOrder:I

    return v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getPackType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->packType:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->versionKey:Ljava/lang/String;

    return-object v0
.end method

.method public getVisible()I
    .registers 2

    .prologue
    .line 113
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->visible:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->id:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    return v0
.end method

.method public setContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)V
    .registers 2
    .param p1, "content"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->content:Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .line 122
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PacksColumn.Pack{ id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->id:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", identifier: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", packType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->packType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", versionKey: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->versionKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", markedForDeletion: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->markedForDeletion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", order: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->displayOrder:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", visible: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->visible:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
