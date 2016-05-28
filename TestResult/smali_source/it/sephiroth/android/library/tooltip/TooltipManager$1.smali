.class Lit/sephiroth/android/library/tooltip/TooltipManager$1;
.super Ljava/lang/Object;
.source "TooltipManager.java"

# interfaces
.implements Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;


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
    .line 34
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 4
    .param p1, "layout"    # Lit/sephiroth/android/library/tooltip/TooltipView;

    .prologue
    .line 38
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipManager;

    invoke-virtual {p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->getTooltipId()I

    move-result v1

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipManager;->hide(I)V

    .line 39
    return-void
.end method
