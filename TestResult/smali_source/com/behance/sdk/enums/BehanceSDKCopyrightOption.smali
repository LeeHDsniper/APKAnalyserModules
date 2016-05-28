.class public final enum Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
.super Ljava/lang/Enum;
.source "BehanceSDKCopyrightOption.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field public static final enum BY:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field public static final enum BY_NC:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field public static final enum BY_NC_ND:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field public static final enum BY_NC_SA:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field public static final enum BY_ND:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field public static final enum BY_SA:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field public static final enum NO_USE:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 35
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    const-string v1, "BY"

    const-string v2, "by"

    invoke-direct {v0, v1, v4, v2}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 36
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    const-string v1, "BY_SA"

    const-string v2, "by-sa"

    invoke-direct {v0, v1, v5, v2}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_SA:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 37
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    const-string v1, "BY_ND"

    const-string v2, "by-nd"

    invoke-direct {v0, v1, v6, v2}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_ND:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 38
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    const-string v1, "BY_NC"

    const-string v2, "by-nc"

    invoke-direct {v0, v1, v7, v2}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 39
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    const-string v1, "BY_NC_SA"

    const-string v2, "by-nc-sa"

    invoke-direct {v0, v1, v8, v2}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC_SA:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 40
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    const-string v1, "BY_NC_ND"

    const/4 v2, 0x5

    const-string v3, "by-nc-nd"

    invoke-direct {v0, v1, v2, v3}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC_ND:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 41
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    const-string v1, "NO_USE"

    const/4 v2, 0x6

    const-string v3, "no-use"

    invoke-direct {v0, v1, v2, v3}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->NO_USE:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 33
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_SA:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    aput-object v1, v0, v5

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_ND:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    aput-object v1, v0, v6

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    aput-object v1, v0, v7

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC_SA:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC_ND:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->NO_USE:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    aput-object v2, v0, v1

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 47
    iput-object p3, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public static getAllCopyrightOptions(Landroid/content/Context;)Ljava/util/Map;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 117
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 118
    .local v0, "all":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;>;"
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->values()[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v4

    .line 119
    .local v4, "values":[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    array-length v6, v4

    const/4 v5, 0x0

    :goto_b
    if-ge v5, v6, :cond_2e

    aget-object v1, v4, v5

    .line 120
    .local v1, "behanceCopyrightOption":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    invoke-virtual {v1, p0}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getCategory(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 122
    .local v2, "category":Ljava/lang/String;
    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 123
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 128
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    :goto_1f
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 125
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    :cond_25
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .restart local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 130
    .end local v1    # "behanceCopyrightOption":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .end local v2    # "category":Ljava/lang/String;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    :cond_2e
    return-object v0
.end method

.method public static getCopyrightOptionFromValue(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 6
    .param p0, "copyrightValue"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->values()[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v1

    .line 93
    .local v1, "values":[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v3, :cond_18

    aget-object v0, v1, v2

    .line 94
    .local v0, "behanceCopyrightOption":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    invoke-virtual {v0}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 98
    .end local v0    # "behanceCopyrightOption":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    :goto_14
    return-object v0

    .line 93
    .restart local v0    # "behanceCopyrightOption":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 98
    .end local v0    # "behanceCopyrightOption":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    :cond_18
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public static getDefaultValue()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 1

    .prologue
    .line 102
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    return-object v0
.end method


# virtual methods
.method public getCategory(Landroid/content/Context;)Ljava/lang/String;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    const/4 v0, -0x1

    .line 78
    .local v0, "response":I
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "no-use"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 79
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_no_license_header:I

    .line 88
    :cond_d
    :goto_d
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 80
    :cond_12
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-sa"

    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nc"

    .line 82
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nd"

    .line 83
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nc-sa"

    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nc-nd"

    .line 85
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 86
    :cond_4e
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_creative_commons_header:I

    goto :goto_d
.end method

.method public getDescription(Landroid/content/Context;)Ljava/lang/String;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 51
    const/4 v0, -0x1

    .line 52
    .local v0, "response":I
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    if-eqz v1, :cond_11

    .line 53
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "no-use"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 54
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_no_use_at_all:I

    .line 69
    :cond_11
    :goto_11
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 55
    :cond_16
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 56
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_cc_by:I

    goto :goto_11

    .line 57
    :cond_23
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-sa"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 58
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_cc_by_sa:I

    goto :goto_11

    .line 59
    :cond_30
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nd"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 60
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_cc_by_nd:I

    goto :goto_11

    .line 61
    :cond_3d
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nc"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4a

    .line 62
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_cc_by_nc:I

    goto :goto_11

    .line 63
    :cond_4a
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nc-sa"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_57

    .line 64
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_cc_by_nc_sa:I

    goto :goto_11

    .line 65
    :cond_57
    iget-object v1, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    const-string v2, "by-nc-nd"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 66
    sget v0, Lcom/behance/sdk/R$string;->bsdk_copyright_cc_by_nc_nd:I

    goto :goto_11
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->value:Ljava/lang/String;

    return-object v0
.end method
