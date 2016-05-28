.class public final Lcom/adobe/creativesdk/aviary/utils/AdobeImageEditorIntentConfigurationValidator;
.super Ljava/lang/Object;
.source "AdobeImageEditorIntentConfigurationValidator.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static validateActivities(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "info"    # Landroid/content/pm/PackageInfo;

    .prologue
    .line 103
    const/4 v1, 0x0

    .line 104
    .local v1, "hasActivity":Z
    iget-object v3, p1, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v4, :cond_1b

    aget-object v0, v3, v2

    .line 105
    .local v0, "activity":Landroid/content/pm/ActivityInfo;
    iget-object v5, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    const-class v6, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 106
    const/4 v1, 0x1

    .line 104
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 109
    .end local v0    # "activity":Landroid/content/pm/ActivityInfo;
    :cond_1b
    const-string v2, "\'AdobeImageEditorActivity\' not found in the AndroidManifest"

    invoke-static {v2, v1}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 110
    return-void
.end method

.method private static validateApplicationContext(Landroid/content/Context;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 154
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 155
    .local v0, "app":Landroid/content/Context;
    invoke-static {v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 156
    const-string v2, "Your Application must implements IAviaryClientCredentials"

    instance-of v3, v0, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    move-object v1, v0

    .line 158
    check-cast v1, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;

    .line 159
    .local v1, "aviaryClientCredentials":Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;
    const-string v2, "getClientID must return a non empty string"

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;->getClientID()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertFalse(Ljava/lang/String;Z)V

    .line 160
    const-string v2, "getClientSecret must return a non empty string"

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;->getClientSecret()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertFalse(Ljava/lang/String;Z)V

    .line 161
    const-string v2, "getBillingKey must return a non empty string"

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;->getBillingKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 162
    return-void
.end method

.method public static validateConfiguration(Landroid/content/Context;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 53
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageEditorIntentConfigurationValidator;->validateApplicationContext(Landroid/content/Context;)V

    .line 55
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x715f

    .line 55
    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 62
    .local v0, "info":Landroid/content/pm/PackageInfo;
    invoke-static {p0, v0}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageEditorIntentConfigurationValidator;->validateReceivers(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V

    .line 63
    invoke-static {p0, v0}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageEditorIntentConfigurationValidator;->validateServices(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V

    .line 64
    invoke-static {p0, v0}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageEditorIntentConfigurationValidator;->validateActivities(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V

    .line 65
    invoke-static {p0, v0}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageEditorIntentConfigurationValidator;->validatePermissions(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V

    .line 66
    return-void
.end method

.method private static validatePermissions(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "info"    # Landroid/content/pm/PackageInfo;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 73
    sget-boolean v3, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v3, :cond_38

    .line 74
    const/4 v3, 0x4

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v3, v2, v4

    const-string v3, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v3, v2, v5

    const-string v3, "android.permission.INTERNET"

    aput-object v3, v2, v6

    const-string v3, "android.permission.BROADCAST_STICKY"

    aput-object v3, v2, v7

    .line 88
    .local v2, "strings":[Ljava/lang/String;
    :goto_1b
    new-instance v1, Ljava/util/ArrayList;

    .line 89
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 91
    .local v1, "required":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v5, p1, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    array-length v6, v5

    move v3, v4

    :goto_28
    if-ge v3, v6, :cond_47

    aget-object v0, v5, v3

    .line 92
    .local v0, "permission":Ljava/lang/String;
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_35

    .line 93
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 91
    :cond_35
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    .line 81
    .end local v0    # "permission":Ljava/lang/String;
    .end local v1    # "required":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "strings":[Ljava/lang/String;
    :cond_38
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v3, v2, v4

    const-string v3, "android.permission.INTERNET"

    aput-object v3, v2, v5

    const-string v3, "android.permission.BROADCAST_STICKY"

    aput-object v3, v2, v6

    .restart local v2    # "strings":[Ljava/lang/String;
    goto :goto_1b

    .line 97
    .restart local v1    # "required":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_47
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_72

    .line 98
    new-instance v5, Ljunit/framework/AssertionFailedError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Missing permission: \'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljunit/framework/AssertionFailedError;-><init>(Ljava/lang/String;)V

    throw v5

    .line 100
    :cond_72
    return-void
.end method

.method private static validateReceivers(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "info"    # Landroid/content/pm/PackageInfo;

    .prologue
    .line 143
    const/4 v0, 0x0

    .line 144
    .local v0, "hasReceiver":Z
    iget-object v3, p1, Landroid/content/pm/PackageInfo;->receivers:[Landroid/content/pm/ActivityInfo;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v4, :cond_18

    aget-object v1, v3, v2

    .line 145
    .local v1, "receiver":Landroid/content/pm/ActivityInfo;
    iget-object v5, v1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    const-class v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 146
    const/4 v0, 0x1

    .line 150
    .end local v1    # "receiver":Landroid/content/pm/ActivityInfo;
    :cond_18
    const-string v2, "\'CdsReceiver\' not found in the AndroidManifest.xml"

    invoke-static {v2, v0}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 151
    return-void

    .line 144
    .restart local v1    # "receiver":Landroid/content/pm/ActivityInfo;
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method private static validateServices(Landroid/content/Context;Landroid/content/pm/PackageInfo;)V
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "info"    # Landroid/content/pm/PackageInfo;

    .prologue
    const/4 v5, 0x0

    .line 114
    const/4 v1, 0x0

    .line 115
    .local v1, "hasService1":Z
    const/4 v2, 0x0

    .line 116
    .local v2, "hasService2":Z
    iget-object v7, p1, Landroid/content/pm/PackageInfo;->services:[Landroid/content/pm/ServiceInfo;

    array-length v8, v7

    move v6, v5

    :goto_7
    if-ge v6, v8, :cond_2d

    aget-object v4, v7, v6

    .line 117
    .local v4, "service":Landroid/content/pm/ServiceInfo;
    iget-object v9, v4, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    const-class v10, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1d

    .line 118
    const/4 v1, 0x1

    .line 116
    :cond_1a
    :goto_1a
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 119
    :cond_1d
    iget-object v9, v4, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    const-class v10, Lcom/adobe/creativesdk/aviary/internal/cds/CdsService;

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a

    .line 120
    const/4 v2, 0x1

    goto :goto_1a

    .line 123
    .end local v4    # "service":Landroid/content/pm/ServiceInfo;
    :cond_2d
    const-string v6, "\'CdsAssetsDownloaderService\' not found in the AndroidManifest"

    invoke-static {v6, v1}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 124
    const-string v6, "\'CdsService\' not found in the AndroidManifest"

    invoke-static {v6, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 126
    const/4 v0, 0x0

    .line 127
    .local v0, "hasProvider":Z
    iget-object v6, p1, Landroid/content/pm/PackageInfo;->providers:[Landroid/content/pm/ProviderInfo;

    array-length v7, v6

    :goto_3b
    if-ge v5, v7, :cond_ba

    aget-object v3, v6, v5

    .line 128
    .local v3, "provider":Landroid/content/pm/ProviderInfo;
    iget-object v8, v3, Landroid/content/pm/ProviderInfo;->name:Ljava/lang/String;

    const-class v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b7

    .line 129
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Wrong value for attribute \'android:authorities\' of the CdsProvider. Found \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v3, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\',"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " but \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 131
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-class v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;

    .line 132
    invoke-virtual {v9}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\' is required"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v3, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-class v11, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;

    invoke-virtual {v11}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 133
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 129
    invoke-static {v8, v9}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 135
    const/4 v0, 0x1

    .line 127
    :cond_b7
    add-int/lit8 v5, v5, 0x1

    goto :goto_3b

    .line 138
    .end local v3    # "provider":Landroid/content/pm/ProviderInfo;
    :cond_ba
    const-string v5, "Missing \'CdsProvider\' from the manifest"

    invoke-static {v5, v0}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 139
    return-void
.end method
