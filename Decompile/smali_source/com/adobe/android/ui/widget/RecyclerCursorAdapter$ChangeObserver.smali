.class Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;
.super Landroid/database/ContentObserver;
.source "RecyclerCursorAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChangeObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;)V
    .registers 3

    .prologue
    .line 340
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>.ChangeObserver;"
    iput-object p1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    .line 341
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 342
    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .registers 2

    .prologue
    .line 346
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>.ChangeObserver;"
    const/4 v0, 0x1

    return v0
.end method

.method public onChange(Z)V
    .registers 3
    .param p1, "selfChange"    # Z

    .prologue
    .line 351
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>.ChangeObserver;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$ChangeObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->onContentChanged()V

    .line 352
    return-void
.end method
