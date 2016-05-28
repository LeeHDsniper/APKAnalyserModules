.class public Landroid/support/v4/content/CursorLoader;
.super Landroid/support/v4/content/AsyncTaskLoader;
.source "CursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/content/AsyncTaskLoader",
        "<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field mCursor:Landroid/database/Cursor;

.field final mObserver:Landroid/support/v4/content/Loader$ForceLoadContentObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">.android/support/v4/content/",
            "Loader$ForceLoadContentObserver;"
        }
    .end annotation
.end field

.field mProjection:[Ljava/lang/String;

.field mSelection:Ljava/lang/String;

.field mSelectionArgs:[Ljava/lang/String;

.field mSortOrder:Ljava/lang/String;

.field mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;
    .param p6, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-direct {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 100
    new-instance v0, Landroid/support/v4/content/Loader$ForceLoadContentObserver;

    invoke-direct {v0, p0}, Landroid/support/v4/content/Loader$ForceLoadContentObserver;-><init>(Landroid/support/v4/content/Loader;)V

    iput-object v0, p0, Landroid/support/v4/content/CursorLoader;->mObserver:Landroid/support/v4/content/Loader$ForceLoadContentObserver;

    .line 101
    iput-object p2, p0, Landroid/support/v4/content/CursorLoader;->mUri:Landroid/net/Uri;

    .line 102
    iput-object p3, p0, Landroid/support/v4/content/CursorLoader;->mProjection:[Ljava/lang/String;

    .line 103
    iput-object p4, p0, Landroid/support/v4/content/CursorLoader;->mSelection:Ljava/lang/String;

    .line 104
    iput-object p5, p0, Landroid/support/v4/content/CursorLoader;->mSelectionArgs:[Ljava/lang/String;

    .line 105
    iput-object p6, p0, Landroid/support/v4/content/CursorLoader;->mSortOrder:Ljava/lang/String;

    .line 106
    return-void
.end method


# virtual methods
.method public deliverResult(Landroid/database/Cursor;)V
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 62
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->isReset()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 64
    if-eqz p1, :cond_b

    .line 65
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 79
    :cond_b
    :goto_b
    return-void

    .line 69
    :cond_c
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    .line 70
    .local v0, "oldCursor":Landroid/database/Cursor;
    iput-object p1, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    .line 72
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 73
    invoke-super {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    .line 76
    :cond_19
    if-eqz v0, :cond_b

    if-eq v0, p1, :cond_b

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_b

    .line 77
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_b
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 35
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v4/content/CursorLoader;->deliverResult(Landroid/database/Cursor;)V

    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    .line 196
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v4/content/AsyncTaskLoader;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 197
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mUri="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 198
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mProjection="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 199
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mProjection:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 200
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSelection="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mSelection:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 201
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSelectionArgs="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 202
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mSelectionArgs:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 203
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSortOrder="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mSortOrder:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 204
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mCursor="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 205
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mContentChanged="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/content/CursorLoader;->mContentChanged:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 206
    return-void
.end method

.method public loadInBackground()Landroid/database/Cursor;
    .registers 8

    .prologue
    .line 49
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/content/CursorLoader;->mUri:Landroid/net/Uri;

    iget-object v2, p0, Landroid/support/v4/content/CursorLoader;->mProjection:[Ljava/lang/String;

    iget-object v3, p0, Landroid/support/v4/content/CursorLoader;->mSelection:Ljava/lang/String;

    iget-object v4, p0, Landroid/support/v4/content/CursorLoader;->mSelectionArgs:[Ljava/lang/String;

    iget-object v5, p0, Landroid/support/v4/content/CursorLoader;->mSortOrder:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 51
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_20

    .line 53
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    .line 54
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mObserver:Landroid/support/v4/content/Loader$ForceLoadContentObserver;

    invoke-interface {v6, v0}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 56
    :cond_20
    return-object v6
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 35
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public onCanceled(Landroid/database/Cursor;)V
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 136
    if-eqz p1, :cond_b

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_b

    .line 137
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 139
    :cond_b
    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 35
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v4/content/CursorLoader;->onCanceled(Landroid/database/Cursor;)V

    return-void
.end method

.method protected onReset()V
    .registers 2

    .prologue
    .line 143
    invoke-super {p0}, Landroid/support/v4/content/AsyncTaskLoader;->onReset()V

    .line 146
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->onStopLoading()V

    .line 148
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_17

    .line 149
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 151
    :cond_17
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    .line 152
    return-void
.end method

.method protected onStartLoading()V
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_9

    .line 118
    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    invoke-virtual {p0, v0}, Landroid/support/v4/content/CursorLoader;->deliverResult(Landroid/database/Cursor;)V

    .line 120
    :cond_9
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object v0, p0, Landroid/support/v4/content/CursorLoader;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_16

    .line 121
    :cond_13
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->forceLoad()V

    .line 123
    :cond_16
    return-void
.end method

.method protected onStopLoading()V
    .registers 1

    .prologue
    .line 131
    invoke-virtual {p0}, Landroid/support/v4/content/CursorLoader;->cancelLoad()Z

    .line 132
    return-void
.end method

.method public setUri(Landroid/net/Uri;)V
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 159
    iput-object p1, p0, Landroid/support/v4/content/CursorLoader;->mUri:Landroid/net/Uri;

    .line 160
    return-void
.end method
