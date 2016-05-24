.class Lcom/localytics/android/TestModeListView$MenuDialog$2;
.super Ljava/lang/Object;
.source "TestModeListView.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/TestModeListView$MenuDialog;->setupViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/TestModeListView$MenuDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/TestModeListView$MenuDialog;)V
    .registers 2

    .prologue
    .line 583
    iput-object p1, p0, Lcom/localytics/android/TestModeListView$MenuDialog$2;->this$1:Lcom/localytics/android/TestModeListView$MenuDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 7
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 587
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$MenuDialog$2;->this$1:Lcom/localytics/android/TestModeListView$MenuDialog;

    invoke-virtual {v0}, Lcom/localytics/android/TestModeListView$MenuDialog;->dismiss()V

    .line 588
    return-void
.end method
