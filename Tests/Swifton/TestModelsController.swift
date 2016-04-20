import Swifton

class TestModelsController: TestApplicationController {
    var testModel: TestModel?

    override func controller() {

    beforeAction("setTestModel", ["only": ["show", "edit", "update", "destroy"]])
    beforeAction("reset", ["only": ["show"]])
    beforeAction("crash", ["skip": ["index", "show", "new", "edit", "create", "update", "destroy"]])

    action("index") { request in
        let testModels = ["testModels": TestModel.allAttributes()]
        return respondTo(request, [
            "html": { render("TestModels/Index", testModels) },
            "json": { renderJSON(context: testModels) }
        ])
    }

    action("show") { request in
        return render("TestModels/Show", self.testModel)
    }

    action("new") { request in
        return render("TestModels/New")
    }

    action("edit") { request in
        return render("TestModels/Edit", self.testModel)
    }

    action("create") { request in
        TestModel.create(attributes: request.params)
        return redirectTo(path: "/testModels")
    }

    action("update") { request in
        self.testModel!.update(attributes: request.params)
        return redirectTo(path: "/testModels/\(self.testModel!.id)")
    }

    action("destroy") { request in
        TestModel.destroy(model: self.testModel)
        return redirectTo(path: "/testModels")
    }

    filter("setTestModel") { request in
        guard let t = TestModel.find(id: request.params["id"]) else { return redirectTo(path: "/testModels") }
        self.testModel = t as? TestModel
        return self.next
    }

    filter("crash") { request in
        let crash: String? = nil
        let _ = crash!
        return self.next
    }
}}
