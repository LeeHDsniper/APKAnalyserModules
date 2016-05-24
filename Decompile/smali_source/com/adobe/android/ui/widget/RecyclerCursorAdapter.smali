.class public abstract Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "RecyclerCursorAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;,
        Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter;"
    }
.end annotation


# instance fields
.field protected mAutoRequery:Z

.field protected mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter",
            "<TT;>.com/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;"
        }
    .end annotation
.end field

.field protected mContext:Landroid/content/Context;

.field protected mCursor:Landroid/database/Cursor;

.field private final mDataSetObservable:Landroid/database/DataSetObservable;

.field protected mDataSetObserver:Landroid/database/DataSetObserver;

.field protected mDataValid:Z

.field protected final mItemIdCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field protected mRowIDColumn:I

.field protected final mViewTypeCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/database/Cursor;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "c"    # Landroid/database/Cursor;
    .param p3, "flags"    # I

    .prologue
    .line 98
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mViewTypeCache:Ljava/util/HashMap;

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mItemIdCache:Ljava/util/HashMap;

    .line 36
    new-instance v0, Landroid/database/DataSetObservable;

    invoke-direct {v0}, Landroid/database/DataSetObservable;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObservable:Landroid/database/DataSetObservable;

    .line 99
    invoke-virtual {p0, p1, p2, p3}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->init(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 100
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/database/Cursor;Z)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "c"    # Landroid/database/Cursor;
    .param p3, "autoRequery"    # Z

    .prologue
    .line 85
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mViewTypeCache:Ljava/util/HashMap;

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mItemIdCache:Ljava/util/HashMap;

    .line 36
    new-instance v0, Landroid/database/DataSetObservable;

    invoke-direct {v0}, Landroid/database/DataSetObservable;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObservable:Landroid/database/DataSetObservable;

    .line 86
    if-eqz p3, :cond_1f

    const/4 v0, 0x1

    :goto_1b
    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->init(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 87
    return-void

    .line 86
    :cond_1f
    const/4 v0, 0x2

    goto :goto_1b
.end method


# virtual methods
.method public changeCursor(Landroid/database/Cursor;)V
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 226
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    .line 227
    .local v0, "old":Landroid/database/Cursor;
    if-eqz v0, :cond_9

    .line 228
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 230
    :cond_9
    return-void
.end method

.method protected clearCaches()V
    .registers 2

    .prologue
    .line 144
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mViewTypeCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 145
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mItemIdCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 146
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 309
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 172
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_10

    .line 173
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 174
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    .line 176
    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 161
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_f

    .line 162
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 164
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public getItemId(I)J
    .registers 7
    .param p1, "position"    # I

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    const-wide/16 v0, 0x0

    .line 184
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    if-eqz v2, :cond_26

    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_26

    .line 185
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mItemIdCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 186
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mItemIdCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 197
    :cond_26
    :goto_26
    return-wide v0

    .line 188
    :cond_27
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 189
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    iget v3, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mRowIDColumn:I

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 190
    .local v0, "id":J
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mItemIdCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_26
.end method

.method public final getItemViewType(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 203
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    iget-boolean v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    if-eqz v1, :cond_37

    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_37

    .line 204
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mViewTypeCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 205
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mViewTypeCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 212
    :goto_24
    return v0

    .line 207
    :cond_25
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->getItemViewTypeUnCached(I)I

    move-result v0

    .line 208
    .local v0, "type":I
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mViewTypeCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    .line 212
    .end local v0    # "type":I
    :cond_37
    const/4 v0, -0x1

    goto :goto_24
.end method

.method public getItemViewTypeUnCached(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 216
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method init(Landroid/content/Context;Landroid/database/Cursor;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "c"    # Landroid/database/Cursor;
    .param p3, "flags"    # I

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v0, 0x1

    .line 112
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->setHasStableIds(Z)V

    .line 114
    and-int/lit8 v2, p3, 0x1

    if-ne v2, v0, :cond_48

    .line 115
    or-int/lit8 p3, p3, 0x2

    .line 116
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mAutoRequery:Z

    .line 120
    :goto_e
    if-eqz p2, :cond_4b

    .line 121
    .local v0, "cursorPresent":Z
    :goto_10
    iput-object p2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    .line 122
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    .line 123
    iput-object p1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mContext:Landroid/content/Context;

    .line 124
    if-eqz v0, :cond_4d

    const-string v1, "_id"

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    :goto_1e
    iput v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mRowIDColumn:I

    .line 125
    and-int/lit8 v1, p3, 0x2

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4f

    .line 126
    new-instance v1, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    invoke-direct {v1, p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;-><init>(Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;)V

    iput-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    .line 127
    new-instance v1, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;

    invoke-direct {v1, p0, v3}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;-><init>(Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$1;)V

    iput-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    .line 133
    :goto_33
    if-eqz v0, :cond_47

    .line 134
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    if-eqz v1, :cond_3e

    .line 135
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    invoke-interface {p2, v1}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 137
    :cond_3e
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    if-eqz v1, :cond_47

    .line 138
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {p2, v1}, Landroid/database/Cursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 141
    :cond_47
    return-void

    .line 118
    .end local v0    # "cursorPresent":Z
    :cond_48
    iput-boolean v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mAutoRequery:Z

    goto :goto_e

    :cond_4b
    move v0, v1

    .line 120
    goto :goto_10

    .line 124
    .restart local v0    # "cursorPresent":Z
    :cond_4d
    const/4 v1, -0x1

    goto :goto_1e

    .line 129
    :cond_4f
    iput-object v3, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    .line 130
    iput-object v3, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    goto :goto_33
.end method

.method protected onContentChanged()V
    .registers 4

    .prologue
    .line 333
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mAutoRequery:Z

    if-eqz v0, :cond_38

    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_38

    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_38

    .line 334
    const-string v0, "Cursor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Auto requerying "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " due to update"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    .line 337
    :cond_38
    return-void
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .registers 6
    .param p1, "newCursor"    # Landroid/database/Cursor;

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>;"
    const/4 v3, 0x0

    .line 243
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    if-ne p1, v2, :cond_7

    .line 244
    const/4 v1, 0x0

    .line 280
    :goto_6
    return-object v1

    .line 247
    :cond_7
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->getItemCount()I

    move-result v0

    .line 249
    .local v0, "oldCount":I
    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    .line 250
    .local v1, "oldCursor":Landroid/database/Cursor;
    if-eqz v1, :cond_21

    .line 251
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    if-eqz v2, :cond_18

    .line 252
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    invoke-interface {v1, v2}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 254
    :cond_18
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    if-eqz v2, :cond_21

    .line 255
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v1, v2}, Landroid/database/Cursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 258
    :cond_21
    iput-object p1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mCursor:Landroid/database/Cursor;

    .line 259
    if-eqz p1, :cond_49

    .line 260
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    if-eqz v2, :cond_2e

    .line 261
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mChangeObserver:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;

    invoke-interface {p1, v2}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 263
    :cond_2e
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    if-eqz v2, :cond_37

    .line 264
    iget-object v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v2}, Landroid/database/Cursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 266
    :cond_37
    const-string v2, "_id"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mRowIDColumn:I

    .line 267
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    .line 269
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->clearCaches()V

    .line 270
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->notifyDataSetChanged()V

    goto :goto_6

    .line 272
    :cond_49
    const/4 v2, -0x1

    iput v2, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mRowIDColumn:I

    .line 273
    iput-boolean v3, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    .line 275
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->clearCaches()V

    .line 276
    invoke-virtual {p0, v3, v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->notifyItemRangeRemoved(II)V

    goto :goto_6
.end method
