.class public final enum Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;
.super Ljava/lang/Enum;
.source "BillingContentFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "StoreType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

.field public static final enum Adobe:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

.field public static final enum Google:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 95
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    const-string v1, "Google"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->Google:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    const-string v1, "Adobe"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->Adobe:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    .line 94
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->Google:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->Adobe:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 94
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;
    .registers 1

    .prologue
    .line 94
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    return-object v0
.end method
