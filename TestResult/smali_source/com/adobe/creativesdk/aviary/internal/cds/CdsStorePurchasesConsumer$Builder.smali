.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;
.super Ljava/lang/Object;
.source "CdsStorePurchasesConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;->context:Landroid/content/Context;

    .line 150
    return-void
.end method


# virtual methods
.method build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;
    .registers 4

    .prologue
    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;->context:Landroid/content/Context;

    if-nez v0, :cond_c

    .line 154
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_c
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;->context:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$1;)V

    return-object v0
.end method
