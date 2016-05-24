.class public Lcom/facebook/ads/internal/view/video/support/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/MediaPlayer$OnInfoListener;


# instance fields
.field private a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/ads/internal/view/video/support/c;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .registers 6

    const/4 v0, 0x3

    if-ne p2, v0, :cond_c

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/support/c;->a:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
