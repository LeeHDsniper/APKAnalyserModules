.class Lit/sephiroth/android/library/tooltip/TooltipView$2;
.super Ljava/lang/Object;
.source "TooltipView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/tooltip/TooltipView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/tooltip/TooltipView;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 2

    .prologue
    .line 199
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipView$2;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 203
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$2;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    const/4 v1, 0x1

    # setter for: Lit/sephiroth/android/library/tooltip/TooltipView;->mActivated:Z
    invoke-static {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->access$202(Lit/sephiroth/android/library/tooltip/TooltipView;Z)Z

    .line 204
    return-void
.end method
