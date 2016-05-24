.class public Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
.super Ljava/lang/Object;
.source "StoreContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private eventAttributes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private eventName:Ljava/lang/String;

.field private extras:Landroid/os/Bundle;

.field private featuredPackId:J

.field private packId:J

.field private packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const-wide/16 v0, -0x1

    .line 323
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 324
    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->packId:J

    .line 325
    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->featuredPackId:J

    .line 326
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->eventAttributes:Ljava/util/HashMap;

    .line 327
    return-void
.end method


# virtual methods
.method public addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 350
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->eventAttributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    return-object p0
.end method

.method public build()Landroid/os/Bundle;
    .registers 5

    .prologue
    .line 360
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 361
    .local v0, "result":Landroid/os/Bundle;
    const-string v1, "extra-pack-id"

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->packId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 362
    const-string v1, "featured_pack_id"

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->featuredPackId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 363
    const-string v1, "extra-pack-type"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 364
    const-string v1, "event_attributes"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->eventAttributes:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 365
    const-string v1, "event_name"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->eventName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    const-string v1, "extras"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->extras:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 367
    return-object v0
.end method

.method public setEvent(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 340
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->eventName:Ljava/lang/String;

    .line 341
    return-object p0
.end method

.method public setExtras(Landroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
    .registers 2
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 355
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->extras:Landroid/os/Bundle;

    .line 356
    return-object p0
.end method

.method public setFeaturedPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 345
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->featuredPackId:J

    .line 346
    return-object p0
.end method

.method public setPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 330
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->packId:J

    .line 331
    return-object p0
.end method

.method public setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
    .registers 2
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 335
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 336
    return-object p0
.end method
