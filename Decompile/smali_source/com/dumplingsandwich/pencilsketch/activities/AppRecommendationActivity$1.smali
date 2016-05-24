.class Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity$1;
.super Ljava/lang/Object;
.source "AppRecommendationActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->display_featured_apps()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;

.field final synthetic val$layout:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;Landroid/widget/LinearLayout;)V
    .registers 3

    .prologue
    .line 62
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;

    iput-object p2, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity$1;->val$layout:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;

    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity$1;->val$layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->onClick(Landroid/view/View;)V

    .line 66
    return-void
.end method
