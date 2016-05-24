.class public final enum Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
.super Ljava/lang/Enum;
.source "BehanceSDKSocialAccountType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

.field public static final enum FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

.field public static final enum TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 28
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    const-string v1, "FACEBOOK"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    const-string v1, "TWITTER"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .line 26
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

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
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static fromName(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    .registers 6
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    if-eqz p0, :cond_20

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_20

    .line 32
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->values()[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    move-result-object v1

    .line 33
    .local v1, "values":[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v3, :cond_20

    aget-object v0, v1, v2

    .line 34
    .local v0, "socialAccountType":Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    invoke-virtual {v0}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 39
    .end local v0    # "socialAccountType":Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    .end local v1    # "values":[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    :goto_1c
    return-object v0

    .line 33
    .restart local v0    # "socialAccountType":Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    .restart local v1    # "values":[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 39
    .end local v0    # "socialAccountType":Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    .end local v1    # "values":[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    :cond_20
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    .registers 1

    .prologue
    .line 26
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    return-object v0
.end method
