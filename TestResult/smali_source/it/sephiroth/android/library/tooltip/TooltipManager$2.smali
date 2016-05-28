.class Lit/sephiroth/android/library/tooltip/TooltipManager$2;
.super Ljava/lang/Object;
.source "TooltipManager.java"

# interfaces
.implements Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/tooltip/TooltipManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/tooltip/TooltipManager;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/tooltip/TooltipManager;)V
    .registers 2

    .prologue
    .line 42
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$2;->this$0:Lit/sephiroth/android/library/tooltip/TooltipManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHideCompleted(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 4
    .param p1, "layout"    # Lit/sephiroth/android/library/tooltip/TooltipView;

    .prologue
    .line 46
    invoke-virtual {p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->getTooltipId()I

    move-result v0

    .line 47
    .local v0, "id":I
    invoke-virtual {p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->removeFromParent()V

    .line 48
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$2;->this$0:Lit/sephiroth/android/library/tooltip/TooltipManager;

    # invokes: Lit/sephiroth/android/library/tooltip/TooltipManager;->printStats()V
    invoke-static {v1}, Lit/sephiroth/android/library/tooltip/TooltipManager;->access$000(Lit/sephiroth/android/library/tooltip/TooltipManager;)V

    .line 49
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$2;->this$0:Lit/sephiroth/android/library/tooltip/TooltipManager;

    # invokes: Lit/sephiroth/android/library/tooltip/TooltipManager;->fireOnTooltipDetached(I)V
    invoke-static {v1, v0}, Lit/sephiroth/android/library/tooltip/TooltipManager;->access$100(Lit/sephiroth/android/library/tooltip/TooltipManager;I)V

    .line 50
    return-void
.end method

.method public onShowCompleted(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 2
    .param p1, "layout"    # Lit/sephiroth/android/library/tooltip/TooltipView;

    .prologue
    .line 55
    return-void
.end method

.method public onShowFailed(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 4
    .param p1, "layout"    # Lit/sephiroth/android/library/tooltip/TooltipView;

    .prologue
    .line 60
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$2;->this$0:Lit/sephiroth/android/library/tooltip/TooltipManager;

    invoke-virtual {p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->getTooltipId()I

    move-result v1

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipManager;->remove(I)V

    .line 61
    return-void
.end method
