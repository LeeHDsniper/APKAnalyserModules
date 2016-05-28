.class Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;
.super Lcom/google/android/gms/ads/AdListener;
.source "ImageEditingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->initializeAdmobBanner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

.field final synthetic val$admob_banner:Lcom/google/android/gms/ads/AdView;


# direct methods
.method constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/google/android/gms/ads/AdView;)V
    .registers 3

    .prologue
    .line 107
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    iput-object p2, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;->val$admob_banner:Lcom/google/android/gms/ads/AdView;

    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdFailedToLoad(I)V
    .registers 4
    .param p1, "errorCode"    # I

    .prologue
    .line 111
    invoke-super {p0, p1}, Lcom/google/android/gms/ads/AdListener;->onAdFailedToLoad(I)V

    .line 112
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;->val$admob_banner:Lcom/google/android/gms/ads/AdView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdView;->setVisibility(I)V

    .line 113
    return-void
.end method
