.class public Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;
.super Landroid/os/Binder;
.source "AdobeImageBillingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    return-object v0
.end method
