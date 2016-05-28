.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$4;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setPackContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

.field final synthetic val$authorLink:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 357
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$4;->val$authorLink:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 361
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$4;->val$authorLink:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 362
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_17

    .line 366
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_16
    return-void

    .line 363
    :catch_17
    move-exception v0

    .line 364
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_16
.end method
