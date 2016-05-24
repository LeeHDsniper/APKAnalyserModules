.class Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;
.super Ljava/lang/Object;
.source "CanvasActivity.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->initializePager()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;


# direct methods
.method constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;)V
    .registers 2

    .prologue
    .line 72
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 97
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 75
    return-void
.end method

.method public onPageSelected(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 79
    div-int/lit8 v0, p1, 0x4

    packed-switch v0, :pswitch_data_3a

    .line 93
    :goto_5
    return-void

    .line 81
    :pswitch_6
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->access$000(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f0f0095

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_5

    .line 84
    :pswitch_13
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->access$000(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f0f0096

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_5

    .line 87
    :pswitch_20
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->access$000(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f0f0097

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_5

    .line 90
    :pswitch_2d
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->access$000(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f0f0098

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_5

    .line 79
    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_6
        :pswitch_13
        :pswitch_20
        :pswitch_2d
    .end packed-switch
.end method
