.class Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;
.super Ljava/lang/Object;
.source "AdapterViewCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/AdapterViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SelectionNotifier"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/internal/widget/AdapterViewCompat;


# direct methods
.method private constructor <init>(Landroid/support/v7/internal/widget/AdapterViewCompat;)V
    .registers 2

    .prologue
    .line 855
    .local p0, "this":Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;, "Landroid/support/v7/internal/widget/AdapterViewCompat<TT;>.SelectionNotifier;"
    iput-object p1, p0, Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;->this$0:Landroid/support/v7/internal/widget/AdapterViewCompat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/internal/widget/AdapterViewCompat;Landroid/support/v7/internal/widget/AdapterViewCompat$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/internal/widget/AdapterViewCompat;
    .param p2, "x1"    # Landroid/support/v7/internal/widget/AdapterViewCompat$1;

    .prologue
    .line 855
    .local p0, "this":Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;, "Landroid/support/v7/internal/widget/AdapterViewCompat<TT;>.SelectionNotifier;"
    invoke-direct {p0, p1}, Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;-><init>(Landroid/support/v7/internal/widget/AdapterViewCompat;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 857
    .local p0, "this":Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;, "Landroid/support/v7/internal/widget/AdapterViewCompat<TT;>.SelectionNotifier;"
    iget-object v0, p0, Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;->this$0:Landroid/support/v7/internal/widget/AdapterViewCompat;

    iget-boolean v0, v0, Landroid/support/v7/internal/widget/AdapterViewCompat;->mDataChanged:Z

    if-eqz v0, :cond_14

    .line 861
    iget-object v0, p0, Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;->this$0:Landroid/support/v7/internal/widget/AdapterViewCompat;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/AdapterViewCompat;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 862
    iget-object v0, p0, Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;->this$0:Landroid/support/v7/internal/widget/AdapterViewCompat;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/widget/AdapterViewCompat;->post(Ljava/lang/Runnable;)Z

    .line 867
    :cond_13
    :goto_13
    return-void

    .line 865
    :cond_14
    iget-object v0, p0, Landroid/support/v7/internal/widget/AdapterViewCompat$SelectionNotifier;->this$0:Landroid/support/v7/internal/widget/AdapterViewCompat;

    # invokes: Landroid/support/v7/internal/widget/AdapterViewCompat;->fireOnSelected()V
    invoke-static {v0}, Landroid/support/v7/internal/widget/AdapterViewCompat;->access$200(Landroid/support/v7/internal/widget/AdapterViewCompat;)V

    goto :goto_13
.end method
